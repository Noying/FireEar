//
//  FireEarViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AudioKitUI

class FireEarViewController: UIViewController {

    @IBOutlet weak var outputPlot: AKNodeOutputPlot!
    @IBOutlet weak var styleNameLabel: UILabel!
    @IBOutlet weak var remainderLabel: UILabel!
    @IBOutlet weak var controlBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            outputPlot.backgroundColor = UIColor.init(named: "playColor")
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func event_gtoMain(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
