import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_coutout/utils/channel.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imagePath;

  void applyMask() async {
    String? originalImagePath = "origin.png";
    String? maskImagePath = "mask.jpeg";

    String? result = await NativeChannel.coutout(originalImagePath, maskImagePath);
    setState(() { 
      String path = (result ?? '').replaceFirst("file://", "");
      imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('抠图Demo'),
      //   leading: IconButton(
      //         icon:  Icon(Icons.arrow_back),
      //         onPressed: () {
                 
      //         },
      //       ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: applyMask,
              child: Text('点击开始抠图'),
            ),
            SizedBox(height: 20),

            imagePath != null
                ? Image.file(File(imagePath!))
                : Text('暂无图片'),
          ],
        ),
      ),
    );
  }
}
