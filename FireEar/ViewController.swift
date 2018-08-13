//
//  ViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/4.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var osicallor: UIButton!
    
   
    var player = MusicPlayerTest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func event_playMusic(_ sender: Any) {
   //     player.playMusic("test.wav", 0.0, endTime: 20.0)
        let wavPath = SystemMacro.getDocumentsPath() + "/test.wav"
        let url = URL.init(fileURLWithPath: wavPath)
        player.createAudioFile(url:url,frequency: 500)
        player.playMusic("test.wav", 0.0, endTime: 20.0)
        print("playMusic button down")
    }
    
  
    @IBAction func event_osicallor(_ sender: Any) {
        player.playMusic(frequncy: 4000)
      //  player.playMusic("test.wav", 0.0, endTime: 20.0)
    }
    
    @IBAction func event_stopMusic(_ sender: Any) {
     
        player.stopMusic()
    }
}

