import 'package:http/http.dart' as http;
import 'package:music/modal/music.dart';
import 'dart:convert';

class Service {
  Future<List<Music>> getTracks(name) async {
    final uri = Uri.parse('https://itunes.apple.com/search?term=${name}');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['results'] as List;
      print(json);

      final tracks = json.map((e) {
        return Music(
          artistName: e['artistName'],
          collectionName: e['collectionName'],
          artworkUrl30: e['artworkUrl30'],
        );
      }).toList();

      return tracks;
    }
    return [];
  }
}
