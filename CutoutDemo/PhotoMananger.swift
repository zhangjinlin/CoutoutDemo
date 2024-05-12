//
//  PhotoMananger.swift
//  CutoutDemo
//
//  Created by jinlin zhang on 2024/5/12.
//

import Foundation
import UIKit
class PhotoManager {
    //抠图操作
    static  func cutout(originImg: UIImage, maskImg: UIImage) -> UIImage? {
        guard let originCGImg = originImg.cgImage,
              let maskCGImg = maskImg.cgImage else {
            return nil
        }
        let width = originCGImg.width
        let height = maskCGImg.height
        guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
              let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil
        }
        context.clip(to: CGRect(x: 0, y: 0, width: width, height: height), mask: maskCGImg)
        
        context.draw(originCGImg, in: CGRect(x: 0, y: 0, width: width, height: height))
        guard let maskedCGImg = context.makeImage() else {
            return nil
        }
        let maskedImg = UIImage(cgImage: maskedCGImg)
        return maskedImg
    }
    
    //保存并按回图片路径
    static func saveImage(img: UIImage) -> String {
        if let imgData = img.pngData() {
            let temporaryDirectory = NSTemporaryDirectory()
            let fileName = ProcessInfo.processInfo.globallyUniqueString + ".png"
            let temporaryFilePath = (temporaryDirectory as NSString).appendingPathComponent(fileName)
            let url = URL(fileURLWithPath: temporaryFilePath)
            do {
                try imgData.write(to: url)
                print(url.absoluteString)
                return url.absoluteString
            } catch {
                return ""
            }
        }
        return ""
    }
}
