//
//  ViewController.swift
//  ParticleAnimationTool
//
//  Created by 赖永鹏 on 2018/12/24.
//  Copyright © 2018年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let particleTool = ParticleAnimationTool()
        
        let layer : CAEmitterLayer
        
        layer = particleTool.createEmitterLayer(self.view)
        self.view.layer .addSublayer(layer)
    }
}

