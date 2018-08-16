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
            let audioFile = try AKAudioFile.init(readFileName: name, baseDir: .documents)
            let player = AKPlayer(audioFile: audioFile)
            player.isLooping = true
           
            AudioKit.output = player
            try AudioKit.start()
          
            player.startTime = 0.0
            player.endTime = 20.0
            player.start(at: AVAudioTime(hostTime: 0))
        } catch  {
            print(error)
        }
        
        
    }
    
    func playMusic(frequncy:Double) -> Void {
        do{
            let oscillator = AKOscillator.init()
            oscillator.frequency = frequncy
            oscillator.amplitude = 0.5
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
    
    
    func createAudioFile(url:URL,frequency:Double) -> AKAudioFile?{
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
                let v = Int16(32767*sin(2*Double.pi*frequency*i/44100))
               // v = (v<<8) + ((v>>8)&0xFF)
                p[i] = v
            }

            try writeFile.write(from: buffer)
            return writeFile
        }catch{
            print("error:\(error)")
        }
        return nil
    }


}


