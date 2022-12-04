import 'dart:convert';

class Music {
  var artistName;
  var collectionName;
  var artworkUrl30;
  var trackPrice;

  Music(
      {this.artistName,
      this.collectionName,
      this.artworkUrl30,
      this.trackPrice});

      
  List<Music> musicFromJson(String str)=>
  List<Music>.from(json.decode(str).map((x)=>Music.fromJson(x)));

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      artistName: json['artistName'],
      collectionName: json['artistName'],
      artworkUrl30: json['artistName'],
    );
  }


  
}
