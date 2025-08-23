import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _currentLoc;
  Set<Circle> _heatCircles = {};

  @override
  void initState() {
    super.initState();
    _initLocation();
    _listenPings();
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled && !(await Geolocator.requestService())) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied &&
        (await Geolocator.requestPermission()) != LocationPermission.granted)
      return;

    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLoc = LatLng(pos.latitude, pos.longitude);
    });
  }

  void _listenPings() {
    FirebaseFirestore.instance.collection('pings').snapshots().listen((snap) {
      final circles = <Circle>{};
      for (var doc in snap.docs) {
        final data = doc.data();
        if (data['lat'] is num && data['lng'] is num) {
          circles.add(
            Circle(
              circleId: CircleId(doc.id),
              center: LatLng(data['lat']! + .0, data['lng']! + .0),
              radius: 50, // meters
              fillColor: Colors.red.withOpacity(0.4),
              strokeWidth: 0,
            ),
          );
        }
      }
      setState(() => _heatCircles = circles);
    });
  }

  Future<void> _goToUser() async {
    if (_currentLoc == null) return;
    final ctrl = await _controller.future;
    ctrl.animateCamera(CameraUpdate.newLatLngZoom(_currentLoc!, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLoc == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _currentLoc!, zoom: 14),
              onMapCreated: (c) => _controller.complete(c),
              circles: _heatCircles,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToUser,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
