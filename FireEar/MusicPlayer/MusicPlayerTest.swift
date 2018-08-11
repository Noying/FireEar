//
//  MusicPlayerTest.swift
//  FireEar
//
//  Created by roy on 2018/8/4.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AudioKit



class MusicPlayerTest: NSObject {
    override init() {
        
    }
    
    func playMusic() -> Void {
        do {
            let mp3Path = SystemMacro.getDocumentsPath() + "/test.wav";
            let url = URL.init(fileURLWithPath: mp3Path)
            if !FileManager.default.createFile(atPath: mp3Path, contents: nil, attributes:nil){
                print("create fail")
                return
            }
            let file = try AKAudioFile.init(forWriting: url, settings:[
                AVFormatIDKey:kAudioFormatLinearPCM,
                AVSampleRateKey:44100,
                AVNumberOfChannelsKey:1,
                AVLinearPCMBitDepthKey:16,
                AVLinearPCMIsFloatKey:true
                ]
            )
            
            let buffer = AVAudioPCMBuffer.init(pcmFormat: AVAudioFormat.init(standardFormatWithSampleRate: 44100, channels: 1)!, frameCapacity: 20*44100)!
            
            let length = buffer.frameLength
            
            for i in 0..<Int(length) {
                var v:Int16 = Int16(0.5*32768*sin(2*Double.pi*8000*i/44100))
                let data = buffer.int16ChannelData!
                v = ((v&0xFF)<<8)|((v>>8)&0xFF)
                
            }
            
            let osicallar = AKOscillator()
            osicallar.frequency = 8000.0
            AudioKit.output = osicallar
            try AudioKit.start();
            osicallar.start()
            
        } catch  {
            print(error)
        }
        
        
    }
    
    func stopMusic() -> Void {
        do {
            try AudioKit.stop()
        } catch  {
            
        }
        
    }
    
    func writeToFile() -> Void{
        
    }
}
