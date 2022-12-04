import 'package:flutter/material.dart';

import '../modal/music.dart';

class MyWidget extends StatefulWidget {
  final Music item;
  const MyWidget({super.key, required this.item});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.artistName.toString()),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Card(
            margin: EdgeInsets.all(8.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Image.network(widget.item.artworkUrl30,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          widget.item.artistName,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            widget.item.collectionName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
