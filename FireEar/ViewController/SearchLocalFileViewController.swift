//
//  SearchLocalFileViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class SearchLocalFileViewController: UIViewController {

    @IBOutlet weak var loadBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBtn.layer.cornerRadius = 4.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func event_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func event_search(_ sender: Any) {
        
    }
    
    @IBAction func event_ok(_ sender: Any) {
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
