//
//  FlutterManager.swift
//  CutoutDemo
//
//  Created by jinlin zhang on 2024/5/12.
//
 
import UIKit
import Foundation
import Flutter
import FlutterPluginRegistrant
//import flutter_downloader
class FlutterManager {
    
    static var shared = FlutterManager()
    
    lazy var methodChannel: FlutterMethodChannel = {
        let channel = FlutterMethodChannel(name:"com.CutoutDemo",binaryMessenger: self.engine.binaryMessenger, codec: FlutterStandardMethodCodec.sharedInstance())
        return channel
    }()
    
    ///flutter的引擎
    lazy var engine = FlutterEngine(name: "CutoutDemo")
    
    //起启flutter
    static func configFlutter() {
        FlutterManager.shared.engine.run()
        
        GeneratedPluginRegistrant.register(with: FlutterManager.shared.engine)
        configChannel(mainChannel: FlutterManager.shared.methodChannel)
    }
    
    //展示view,测试
    static func showFlutterView(_ vc: UIViewController) {
 
    }
    
    //原生与flutter进行方法通信
    static func configChannel(mainChannel: FlutterMethodChannel) {
        mainChannel.setMethodCallHandler { (call, result) in
            switch call.method {
                //抠图
            case "coutout":
                guard let args = call.arguments as? [String: Any],
                      let originalImagePath = args["originalImagePath"] as? String,
                      let maskImagePath = args["maskImagePath"] as? String else {
                    result(nil)
                    return
                }
                if let originalImage = UIImage(named: originalImagePath),
                   let maskImage = UIImage(named: maskImagePath) {
                    if let maskedImg = PhotoManager.cutout(originImg: originalImage, maskImg: maskImage)  {
                        let url = PhotoManager.saveImage(img: maskedImg)
                        result(url)
                    } else {
                        result(nil)
                    }
                } else {
                    result(nil)
                }
            default :
                result(FlutterMethodNotImplemented)
            }
        }
    }
    

}


