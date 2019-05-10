//
//  ViewController.swift
//  GIF图片播放
//
//  Created by 赖永鹏 on 2019/1/8.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//       1. 获取图片路径
        guard let filePath = Bundle.main.path(forResource: "demo.gif", ofType: nil) else {
            return
        }
//        2.根据路径，将gif转成NSData类型
        guard  let imageData = NSData(contentsOfFile: filePath) else {
            return
        }
//        3.根据imageData创建CGImageSource
        guard let imageSource = CGImageSourceCreateWithData(imageData, nil) else {
            return
        }
//        4.获取imageSource中的图片个数
        let frameCount = CGImageSourceGetCount(imageSource)
        
//        5.获取一张张的图片
        var images = [UIImage]()
        var duration : TimeInterval = 0
        
        for i in 0..<frameCount {
//            5.1 获取图片
            guard let image = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else{
                return
            }
            images.append(UIImage(cgImage: image))
            
//            5.2 获取每张图片的时间
            guard let imageDict = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? [String : Any] else {continue}
            print(imageDict)
            
            guard let GifDict = imageDict[kCGImagePropertyGIFDictionary as String] as? [String : Any] else {continue}
            guard let delaytime = GifDict[kCGImagePropertyGIFDelayTime as String] as? NSNumber else {continue}
            
            duration += delaytime.doubleValue
        }
        
        ImageView.animationImages = images
        ImageView.animationDuration = duration
        ImageView.animationRepeatCount = 0
        ImageView.startAnimating()
    }

}

