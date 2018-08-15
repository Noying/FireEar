//
//  MusicCreateManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/15.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation
import AudioKit

class MusicCreateManger{
    enum OptionError:Error {
        case RateError(String)
        case BitError(String)
        case InvalidError (String)
    }
    
    /// 混合不同频率的音频
    ///
    /// - Parameters:
    ///   - buffer: pcm字符串,默认是16位整数,非16位整数抛出异常,采样率为44100
    ///   - frqsAndAltm: （频率，振幅）
    ///   - startTime: 开始时间
    ///   - endTime: 关闭时间
    /// - Returns: 返回改好的字符串
    func setBuffer(buffer:AVAudioPCMBuffer,frqsAndAltm:[(Double,Double)],startTime:Double,endTime:Double)
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
}
