import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> fetchCrowdLevel(
    double south, double west, double north, double east) async {
  final url = Uri.parse(
      'https://overpass-api.de/api/interpreter?data=[out:json];node["amenity"]($south,$west,$north,$east);out;');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['elements']?.length ?? 0;
  } else {
    print('Overpass API failed: ${response.statusCode}');
    return 0;
  }
}
