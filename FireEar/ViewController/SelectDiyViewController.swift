//
//  SelectDiyViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class SelectDiyViewController: UIViewController {

    @IBOutlet weak var localFileBtn: UIButton!
    @IBOutlet weak var createDiyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        localFileBtn.layer.cornerRadius = 4.0
        createDiyBtn.layer.cornerRadius = 4.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func event_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
