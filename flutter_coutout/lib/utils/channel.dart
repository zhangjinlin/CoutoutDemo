//和原生通信的方法
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class NativeChannel {

  static const MethodChannel _channel = const MethodChannel('com.CutoutDemo');
  //处理图片
  static Future<String?> coutout(String originalImagePath, String maskImagePath) async {
    try {
      final String? imagePath = await _channel.invokeMethod('coutout', {
        'originalImagePath': originalImagePath,
        'maskImagePath': maskImagePath,
      });
      return imagePath;
    } on PlatformException catch (e) { 
      return null;
    }
  }
 
}
