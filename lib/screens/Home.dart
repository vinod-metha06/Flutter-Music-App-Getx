import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/controller/musicContriller.dart';
import 'package:music/screens/traklist.dart';
import 'package:music/views/loading.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final MusicController musicController = Get.put(MusicController());

    return Scaffold(
      appBar: AppBar(title: Text("Music App"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.blueAccent)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                hintText: 'Search your songs',
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await musicController.fetchTracks(controller.text);
              musicController.trackList.isEmpty
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tracks()),
                    );
            },
            child: Container(
                width: 80,
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blueAccent,
                  border: Border.all(),
                ),
                child: Text("Search")),
          ),
          Obx(() {
            if (musicController.isLoading.value) {
              return Loading();
            }
            return Text("");
          })
        ],
      ),
    );
  }
}
