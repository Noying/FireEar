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
    
    @IBOutlet weak var remainderLabel: UILabel!
    @IBOutlet weak var controlBtn: UIButton!
    
    var taskRunInWhere:TaskRunInWhere!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch taskRunInWhere.taskStyle {
        case .autoFire:
            self.createAutoFireFile();
            break;
        case .customFire:
            break;
        case .localFire:
            break;
        }
        
    }
    
    func createAutoFireFile(){
        let info = taskRunInWhere.taskInfo as! NSDictionary
        let step = info.value(forKey: "step") as! Int
        let remaindar = taskRunInWhere.remaindarTime
        let stepDic = TaskStepArray.singleton.stepArray[step] as! NSDictionary
        self.title = stepDic.value(forKey: "stepName") as? String
        
        self.remainderLabel.text = "所剩时间: " + SystemMacro.timeStringFromSecond(remaindar!);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func event_playOrPause(_ sender: Any) {
        let btn:UIButton = sender as! UIButton
        btn.tag = btn.tag^1;
        if(btn.tag==0){
            btn.setImage(UIImage(named: "play"), for: UIControl.State.normal) ;
            taskRunInWhere.play()
        }else{
            btn.setImage(UIImage(named: "stop"), for: UIControl.State.normal)  ;
            taskRunInWhere.pause()
        }
        
    }
    
    @IBAction func event_gtoMain(_ sender: Any) {
        
        for vc in self.navigationController!.viewControllers{
            if vc is MainViewController{
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
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
