//
//  MusicCreateManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/15.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation
import AudioKit

class MusicCreateManger:NSObject{
    enum OptionError:Error {
        case RateError(String)
        case BitError(String)
        case InvalidError (String)
    }
    
    override init() {
        super.init()
    }
    
    /// 混合不同频率的音频
    ///
    /// - Parameters:
    ///   - buffer: pcm字符串,默认是16位整数,非16位整数抛出异常,采样率为44100
    ///   - frqsAndAltm: （频率，振幅）
    ///   - startTime: 开始时间
    ///   - endTime: 关闭时间
    /// - Returns: 返回改好的字符串
    func setBuffer(_ buffer:AVAudioPCMBuffer,frqsAndAltm:[(Double,Double)],startTime:Double,endTime:Double)
        throws -> AVAudioPCMBuffer {
            guard (buffer.value(forKey: AVSampleRateKey)! as! Double) == 44100 else {
                throw OptionError.RateError("the rate of buffer is error")
            }
            guard (buffer.value(forKey: AVLinearPCMBitDepthKey)! as! Int) == 16 &&
                !(buffer.value(forKey: AVLinearPCMIsFloatKey)! as! Bool) else {
                throw OptionError.BitError("the bit is error or pcm is float!")
            }
            guard buffer.frameLength < Int(endTime*44100) else {
                throw OptionError.InvalidError("Invalid endTime")
            }
            let endFrame = Int(endTime*44100)
            let startFrame = Int(startTime*44100)
            let data = buffer.int16ChannelData!
            let p = data.pointee
            for i in startFrame...endFrame {
                let nums = frqsAndAltm.count
                var v:Int = 0;
                for (frq,altm) in frqsAndAltm{
                    v += Int(32627*altm*sin(2*Double.pi*frq*i/44100))
                }
                let pf = Int16(v/nums)
                p[i] = pf
            }
        return buffer;
    }
    
    func createBuffer(time:Double) -> AVAudioPCMBuffer? {
        let buffer = AVAudioPCMBuffer.init(pcmFormat: AVAudioFormat.init(settings:[
            AVFormatIDKey:kAudioFormatLinearPCM,
            AVSampleRateKey:44100,
            AVNumberOfChannelsKey:1,
            AVLinearPCMBitDepthKey:16,
            AVLinearPCMIsFloatKey:false
            ])!, frameCapacity:AVAudioFrameCount(Int(time*44100)))
        return buffer
    }
    
    func setBuffer(_ buffer:AVAudioPCMBuffer,startFreq:Double,endFreq:Double,sweepTime:Double,altm:Double,startTime:Double,endTime:Double) throws ->AVAudioPCMBuffer {
        guard (buffer.value(forKey: AVSampleRateKey)! as! Double) == 44100 else {
            throw OptionError.RateError("the rate of buffer is error")
        }
        guard (buffer.value(forKey: AVLinearPCMBitDepthKey)! as! Int) == 16 &&
            !(buffer.value(forKey: AVLinearPCMIsFloatKey)! as! Bool) else {
                throw OptionError.BitError("the bit is error or pcm is float!")
        }
        guard buffer.frameLength < Int(endTime*44100) else {
            throw OptionError.InvalidError("Invalid endTime")
        }
        let endFrame = Int(endTime*44100)
        let startFrame = Int(startTime*44100)
        let data = buffer.int16ChannelData!
        let point = data.pointee
        for i in 0...endFrame-startFrame {
            let k = exp(log((startFreq)/endFreq)/sweepTime)
            let dt = 1.0/44100
            let p = 2*Double.pi*startFreq/log(k)
            let fsweap = Int(44100*sweepTime)
            let t = dt*(i%fsweap)
            let data = Int16(32527*altm*sin( p*(pow(k,t)-1)))
            
            point[i+startFrame] = data
        }
        return buffer
    }
    
    func writeToPath(path:String,buffer:AVAudioPCMBuffer) -> Void {
        do {
            let url = URL(fileURLWithPath: path)
            let file = try AKAudioFile.init(forWriting: url, settings:buffer.format.settings)
            try file.write(from: buffer)
        } catch  {
            print(error)
        }
    }
    
    func writeDefault(step:TaskStepInfo) -> Void {
        do {
            let path = SystemMacro.getDocumentsPath()+"/"+step.stepName!+".caf" //判断如果该文件不存在
            var buffer = self.createBuffer(time: 20)
            buffer = try self.setBuffer(buffer!, startFreq: step.startFreq!, endFreq: step.endFreq!, sweepTime: step.sweeptime!, altm: step.vol!, startTime: 0, endTime: 20)
            self.writeToPath(path:path, buffer: buffer!)
        } catch  {
            print(error)
        }
      
    }
}
