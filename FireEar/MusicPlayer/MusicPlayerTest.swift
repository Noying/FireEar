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
    
    func playMusic(_ name:String,_ startTime:Double,endTime:Double) -> Void {
        do {
            let player = AKPlayer(url: URL(fileURLWithPath: name))
            var i = 0
            player?.completionHandler = {

                if i<1 {
                   player?.play()
                }
                i = i+1
                AKLog(i)
            }
            
            AudioKit.output = player
            try AudioKit.start()
          
            

           
           //player?.isLooping = true
            
            player?.play()
          
        } catch  {
            print(error)
        }
        
        
    }
    
    func playMusic(frequncy:Double) -> Void {
        do{
            let oscillator = AKOscillator()
            //oscillator.frequency = frequncy
            AudioKit.output = oscillator
            
            try AudioKit.start()
            oscillator.play()
        }catch{
            print(error)
        }
    }
    
    func stopMusic() -> Void {
        do {
            AudioKit.output = nil
            try AudioKit.stop()
        } catch  {
            
        }
    }
    
    
    func createAudioFile(url:URL,frequency:Double) -> Void{
        do{    
                    let writeFile = try AKAudioFile.init(forWriting: url, settings:[
                        AVFormatIDKey:kAudioFormatLinearPCM,
                        AVSampleRateKey:44100,
                        AVNumberOfChannelsKey:1,
                        AVLinearPCMBitDepthKey:16,
                        AVLinearPCMIsFloatKey:false
                        ],commonFormat:AVAudioCommonFormat.pcmFormatInt16,interleaved:false
                    )

        
                    let buffer = AVAudioPCMBuffer.init(pcmFormat:writeFile.processingFormat, frameCapacity: 20*44100)!
                    buffer.frameLength = buffer.frameCapacity
                    let length = buffer.frameCapacity
                    let data = buffer.int16ChannelData!
                    let p = data.pointee
                    for i in 0..<Int(length) {
                       // let v = Int16(32767*sin(2*Double.pi*frequency*i/44100))
                       // v = (v<<8) + ((v>>8)&0xFF)
                        let v = createSweepData(20.0, 20000, sweepTime: 5, sampleRate: 44100, peak: 32767, frame: i)
                        p[i] = v
                    }
        
                    try writeFile.write(from: buffer)
        }catch{
            print("error:\(error)")
        }
    }
    
    private func createSweepData(_ f0:Double,_ f1:Double,sweepTime:Double,sampleRate:Int,peak:Int,frame:Int) -> Int16 {
        let k = exp(log((f1)/f0)/sweepTime)
        let dt = 1.0/sampleRate
        let p = 2*Double.pi*f0/log(k)
        let fsweap = Int(sampleRate*sweepTime)
        let t = dt*(frame%fsweap)
        let data = Int16(peak*sin( p*(pow(k,t)-1)))
        return data
    }

}


