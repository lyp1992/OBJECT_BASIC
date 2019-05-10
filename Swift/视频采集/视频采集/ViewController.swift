//
//  ViewController.swift
//  视频采集
//
//  Created by 赖永鹏 on 2018/12/26.
//  Copyright © 2018年 LYP. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    fileprivate var videoInput : AVCaptureDeviceInput?
    fileprivate var videoOutput : AVCaptureVideoDataOutput?
    fileprivate var movieOutput : AVCaptureMovieFileOutput?
    fileprivate var previewLayer : AVCaptureVideoPreviewLayer?
    fileprivate lazy var session : AVCaptureSession = AVCaptureSession()
    
    fileprivate var fileUrl : URL? {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/abd.mp4"
        return URL(fileURLWithPath: path)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        视频输入输出
        setupVideoInputOutput()
        
//        音频输入输出
        setupAudioIntputOutPut()
        
//        初始化写入文件的output
        
    }
    @IBAction func startCollectVideo(_ sender: UIButton) {
//        开始采集
        session.startRunning()
//        设置预览层
        setupPrepareLayer()
        
    }
    
    @IBAction func stopCollectionVideo(_ sender: Any) {
        movieOutput?.stopRecording()
        session.stopRunning()
        previewLayer?.removeFromSuperlayer()
    }
    
    @IBAction func switchLens(_ sender: UIButton) {
//       取出之前的镜头
        guard let videoInput = videoInput else {
            return
        }
        let position: AVCaptureDevice.Position = videoInput.device.position == .front ? .back : .front
        guard let devices = AVCaptureDevice.devices() as?[AVCaptureDevice] else {
            return
        }
        guard let device = devices.filter({$0.position == position}).first else {
            return
        }
        guard let newInput = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        
//        移除之前的input，添加新的input
        session.removeInput(videoInput)
        session.beginConfiguration()
        if session.canAddInput(newInput){
            session.addInput(newInput)
        }
        session.commitConfiguration()
        
//        保存新的input
        self.videoInput = newInput
    }
}

extension ViewController {
    
    fileprivate func setupVideoInputOutput() {
        
//        添加视频输入
        guard let devices = AVCaptureDevice.devices() as?[AVCaptureDevice] else {
            return
        }
        print(devices);
        guard let device = devices.filter({ $0.position == .front}).first else {
            return
        }
        guard let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        self.videoInput = input
        
//        添加视频输出
        let output = AVCaptureVideoDataOutput()
        let queue = DispatchQueue.global()
        output.setSampleBufferDelegate(self as? AVCaptureVideoDataOutputSampleBufferDelegate, queue: queue)
        self.videoOutput = output
        
//        添加输入输出
        addIntputOutputSession(input, output)
    }
    
    fileprivate func setupAudioIntputOutPut(){
//        创建输入
        guard let device = AVCaptureDevice.default(for: AVMediaType.audio) else { return }
        guard let intput = try? AVCaptureDeviceInput(device: device) else {
            return
        }
//        创建输出
        let output = AVCaptureAudioDataOutput()
        let queue = DispatchQueue.global()
        output.setSampleBufferDelegate(self as? AVCaptureAudioDataOutputSampleBufferDelegate, queue: queue)
        
//        添加输入输出
        addIntputOutputSession(intput, output)
    }
    
    private func addIntputOutputSession(_ intput : AVCaptureDeviceInput, _ output : AVCaptureOutput){
        session.beginConfiguration()
        if session.canAddInput(intput){
            session.addInput(intput)
        }
        if session.canAddOutput(output){
            session.addOutput(output)
        }
        session.commitConfiguration()
        
    }
    
//    创建预览层
    fileprivate func setupPrepareLayer(){
        
//        创建预览层
        guard let preparelayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: session) else{
            return
        }
//        设置preparelayer属性
        preparelayer.frame = view.bounds
     
//        将图层添加到控制器的view的layerView上
        view.layer.insertSublayer(preparelayer, at: 0)
        self.previewLayer = preparelayer
    }
    
    fileprivate func setupMoivefileOutput() {
        
//        创建写入文件的输出
        let fileOutput = AVCaptureMovieFileOutput()
        self.movieOutput = fileOutput
        
        if session.canAddOutput(fileOutput) {
            session.addOutput(fileOutput)
        }
        
        let connetion = fileOutput.connection(with: AVMediaType.video)
        connetion?.automaticallyAdjustsVideoMirroring = true
        
    }
}

extension ViewController : AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if ((videoOutput?.connection(with: AVMediaType.video)) != nil) {
            print("采集到了视频")
        }else{
            print("采集到了音频")
        }
    }
    
}

// mark：通过代理监听开始写入文件，以及结束写入文件
extension ViewController : AVCaptureFileOutputRecordingDelegate {
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        print("开始写入文件")
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        print("停止写入文件")
    }
}
