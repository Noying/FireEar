//
//  LocalFileViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import MediaPlayer

class LocalFileViewController: UIViewController,MPMediaPickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func event_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func event_presentItunesMediaPickerController(_ sender: Any) {
        let controller:MPMediaPickerController = MPMediaPickerController(mediaTypes: .music);
        controller.allowsPickingMultipleItems = true
        controller.prompt = "本地文件";
        controller.delegate = self;
        self.present(controller, animated: true, completion: nil)
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        [mediaPicker .dismiss(animated: true, completion: {
            //刷新列表
        })];
    }
    
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        [mediaPicker .dismiss(animated: true, completion: {
             //刷新列表
        })];
    }

}
