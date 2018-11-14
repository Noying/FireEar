//
//  SelectModelViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/17.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation
import UIKit

class SelectModelViewController: UIViewController {
    
    @IBOutlet weak var autoFireButton: UIButton!
    @IBOutlet weak var diyFireButton: UIButton!
    
    override func viewDidLoad() {
        autoFireButton.layer.cornerRadius = 4.0
        diyFireButton.layer.cornerRadius = 4.0
    }

    @IBAction func event_FireEar(_ sender: Any) {
        let taskDefault = TaskRunInWhere.getNewAutoInfo()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc:FireEarViewController = storyboard.instantiateViewController(withIdentifier: "FireEarViewController") as! FireEarViewController
        vc.taskRunInWhere = taskDefault
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func event_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
}
