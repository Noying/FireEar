//
//  TaskRunInWhere.swift
//  FireEar
//
//  Created by roy on 2018/11/12.
//  Copyright © 2018 Iceroy. All rights reserved.
//

import Foundation
import ReactiveSwift

enum TaskStyle{
    case autoFire //一键煲机
    case customFire //自定义煲机
    case localFire //本地煲机
}

class TaskRunInWhere: NSObject {
    var taskStyle:TaskStyle = .autoFire
    var taskInfo:Any! //主要信息，一键煲机包含[步骤，步骤所剩时间] 自定义煲机[煲机信息，所剩时间] 本地煲机[文件地址列表，所剩时间,播放到那首歌]
    var remaindarTime:Int! //剩余时间
    let scheduler = QueueScheduler();
    override init() {
        super.init()
    }
    
    static func getNewAutoInfo() -> TaskRunInWhere{
        let task = TaskRunInWhere()
        task.taskStyle = .autoFire
        let step = 0;
        let dic:NSDictionary = TaskStepArray.singleton.stepArray[0] as! NSDictionary;
        let hour = dic.value(forKey: "stepTime") as! Int
        let remaindarTime = hour * 60 * 60
        let dicInfo:NSDictionary = ["step":step,"remaindarTime":remaindarTime];
        task.taskInfo = dicInfo
        return task;
    }
    
    func run(){ //定时开始计时
        self.scheduler.schedule(after: Date(), interval: DispatchTimeInterval.seconds(2)) {
            NSLog("123")
        }
    }
    
    func pause(){ //暂停计时
        
    }
}
