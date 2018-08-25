//
//  MusicPlayer.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/15.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation
import AudioKit

class MusicPlayer: NSObject {
    var isloop:Bool = false
    var playPath:[String]?
    var keepTime:UInt?  //持续时间
    var filePlayer:AKPlayer?
    
    static let shared:MusicPlayer = MusicPlayer()
    
    private override init() {
        super.init()
    }
    
    func play() -> Void {
        do {
            filePlayer?.start(at:AVAudioTime(hostTime: 0))
            try AudioKit.start()
        } catch  {
            print(error)
        }
       
    }
    
    func play(_ path:String)->Void{
        do {
            let file = try AKAudioFile(readFileName: path)
            filePlayer = AKPlayer(audioFile: file)
            self.play()
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
