//
//  ViewController.swift
//  CutoutDemo
//
//  Created by jinlin zhang on 2024/5/12.
//

import UIKit
import Flutter
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        let width = UIScreen.main.bounds.size.width
        let originalImage = UIImage(named: "origin.png")
        let maskImage = UIImage(named: "mask.jpeg")
        let imageView1 = UIImageView(image: originalImage)
        
        imageView1.frame = CGRect(x: (width - 300)/2, y: 100, width: 300, height: 240)
        imageView1.contentMode = .scaleAspectFit
        self.view.addSubview(imageView1)
        
        let imageView2 = UIImageView(image: maskImage)
        imageView2.frame = CGRect(x: (width - 300)/2, y: 340, width: 300, height: 240)
        imageView2.contentMode = .scaleAspectFit
        self.view.addSubview(imageView2)
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: 50, y: 660, width: 250, height: 40)
        button.setTitle("跳转到flutter页面抠图", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(handleImage), for: .touchUpInside)
    }
    
    @objc  func handleImage() {
        let flutterEngine = FlutterManager.shared.engine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(flutterViewController, animated: true)
        //        present(flutterViewController, animated: true, completion: nil)
    }
    
    
}

