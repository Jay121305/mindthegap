import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, double>?> getCoordinatesFromPlace(String place) async {
  final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(place)}&format=json&limit=1');

  final response = await http.get(url, headers: {
    'User-Agent': 'MindTheGapApp/1.0 (your_email@example.com)' // optional
  });

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      return {
        'lat': double.parse(data[0]['lat']),
        'lon': double.parse(data[0]['lon']),
      };
    }
  }
  return null;
}
