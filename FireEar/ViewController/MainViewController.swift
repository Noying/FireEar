//
//  MainViewController.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class MainViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    let player = MusicPlayerTest()

    @IBOutlet var tableView: UITableView!
    var leftViewController:UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let cellNib = UINib(nibName: "TaskCell", bundle:nil)
        self.tableView .register(cellNib, forCellReuseIdentifier: "TaskCellID")
        
        let play = MusicPlayer.shared
        play.isloopAlways = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func event_user(_ sender: Any) {
//        let window = UIApplication.shared.keyWindow
//        leftViewController?.view.frame = CGRect.init(x: 0, y: 0, width: 30, height: 200)
//        window?.addSubview((leftViewController?.view)!) //可行
        
    }
    
    //MARK: - tableview delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskCellID") as! TaskCell
        
        return cell
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
