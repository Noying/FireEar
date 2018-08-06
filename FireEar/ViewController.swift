//
//  ViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/4.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var player = MusicPlayerTest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func event_playMusic(_ sender: Any) {
       player.playMusic()
    }
    
    @IBAction func event_stopMusic(_ sender: Any) {
        player.stopMusic()
    }
}

