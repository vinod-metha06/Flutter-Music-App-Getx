import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/screens/detailspage.dart';

import '../controller/musicContriller.dart';

class Tracks extends StatelessWidget {
  const Tracks({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicController musicController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Obx(() {
        if (musicController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: musicController.trackList.length,
          itemBuilder: (context, index) {
            var item = musicController.trackList[index];
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: ListTile(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWidget(item: item)));
                }),
                leading: Container(
                  height: 100,
                  child: CircleAvatar(
                    child: Image.network(item.artworkUrl30, height: 100),
                  ),
                ),
                title: Text(item.artistName.toString().length >= 20
                    ? item.artistName.toString().substring(0, 20) + "..."
                    : item.artistName),
              ),
            );
          },
        );
      }),
    );
  }
}
