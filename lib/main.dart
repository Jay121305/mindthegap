import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindTheGap',
      theme: ThemeData.dark(),
      home: const HeatMapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HeatMapScreen extends StatefulWidget {
  const HeatMapScreen({super.key});

  @override
  State<HeatMapScreen> createState() => _HeatMapScreenState();
}

class _HeatMapScreenState extends State<HeatMapScreen> {
  Completer<GoogleMapController> _mapC = Completer();
  LatLng? _self;
  Set<Circle> _heat = {};

  @override
  void initState() {
    super.initState();
    _initLocation();
    _startListening();
  }

  Future<void> _initLocation() async {
    bool service = await Geolocator.isLocationServiceEnabled();
    if (!service && !(await Geolocator.requestService())) return;

    LocationPermission perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied &&
        (await Geolocator.requestPermission()) != LocationPermission.granted)
      return;

    Position pos = await Geolocator.getCurrentPosition();
    setState(() {
      _self = LatLng(pos.latitude, pos.longitude);
    });
  }

  void _startListening() {
    FirebaseFirestore.instance.collection('pings').snapshots().listen((snap) {
      final circles = <Circle>{};
      for (var doc in snap.docs) {
        final d = doc.data();
        if (d['lat'] is num && d['lng'] is num) {
          circles.add(Circle(
            circleId: CircleId(doc.id),
            center:
                LatLng(d['lat'].toDouble(), d['lng'].toDouble()),
            radius: 50,
            fillColor: Colors.red.withOpacity(0.45),
            strokeWidth: 0,
          ));
        }
      }
      setState(() {
        _heat = circles;
      });
    });
  }

  Future<void> _locateMe() async {
    if (_self == null) return;
    final ctrl = await _mapC.future;
    ctrl.animateCamera(CameraUpdate.newLatLngZoom(_self!, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _self == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _self!, zoom: 14),
              circles: _heat,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (ctrl) => _mapC.complete(ctrl),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _locateMe,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
