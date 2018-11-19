//
//  MusicPlayer.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/15.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation
import AudioKit
import ReactiveCocoa

class MusicPlayer: NSObject {
    var filePlayer:AKPlayer?
    var isloopAlways:Bool = true
    var playPath:[String]?
    var keepTime:UInt?  //持续时间
    
    
    static let shared:MusicPlayer = MusicPlayer()
    
    private override init() {
        super.init()
        self.filePlayer = AKPlayer()
        
    }
    
    func play() -> Void {
        do {
            filePlayer?.play()
            try AudioKit.start()
        } catch  {
            print(error)
        }
       
    }
    
    func play(_ path:String)->Void{
        do {
            let file = try AKAudioFile(readFileName: path, baseDir: .documents)
            filePlayer?.load(audioFile: file)
            self.play()
        } catch  {
            print(error)
        }
       
    }
    
    func play(_ path:String,time:Int){
        do {
            try self.filePlayer?.load(url: URL(fileURLWithPath: path))
            self.filePlayer?.volume = 1.0;
            let duration = Int(self.filePlayer!.duration)
            var loop = 0
            let maxloops = time/duration
            
            self.filePlayer!.completionHandler = {
                if loop<maxloops{
                    self.filePlayer!.play()
                }
                loop = loop+1
                AKLog(loop)
            }
            
            AudioKit.output = self.filePlayer
            try AudioKit.start()
            
            self.filePlayer!.play()
            
        } catch  {
            print(error)
        }
    }
    
    func stop() -> Void {
        do {
            try AudioKit.stop()
            filePlayer?.stop()
        } catch  {
            print(error)
        }
    }
    
    
}
