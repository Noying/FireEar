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
    func playMusic() -> Void {
        let oslicuar = AKOscillator()
        AudioKit.output = oslicuar
        do {
            try  AudioKit.start()
        } catch {
            //do noting
        }
       
        oslicuar.start()
        oslicuar.frequency = random(in: 220...880)
    }
    
    func stopMusic() -> Void {
        do {
            try AudioKit.stop()
        } catch  {
            
        }
        
    }
}
