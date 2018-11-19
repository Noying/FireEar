//
//  TaskRunInWhere.swift
//  FireEar
//
//  Created by roy on 2018/11/12.
//  Copyright © 2018 Iceroy. All rights reserved.
//

import Foundation
import ReactiveSwift

enum TaskStyle:Int{
    case autoFire = 0 //一键煲机
    case customFire  = 1 //自定义煲机
    case localFire = 2 //本地煲机
}

class TaskRunInWhere: NSObject {
    var taskStyle:TaskStyle = .autoFire
    var taskInfo:Any? //主要信息，一键煲机包含[步骤] 自定义煲机[自定义文件地址] 本地煲机[文件地址列表,播放到那首歌]
    var remaindarTime:Int! //剩余时间
    let scheduler = QueueScheduler.init();
    var schedulerDispos:Disposable!
    override init() {
        super.init()
    }
    
    //从nsobject解析回来
    init(coder aDecoder:NSCoder!){
        self.taskStyle = TaskStyle(rawValue: aDecoder.decodeInteger(forKey: "style"))!
        self.taskInfo = aDecoder.decodeObject(forKey:"info") as Any
        self.remaindarTime = aDecoder.decodeInteger(forKey: "time")
        
    }
    
    //编码成object
    func encodeWithCoder(aCoder:NSCoder!){
        aCoder.encode(self.taskStyle.rawValue,forKey:"style")
        aCoder.encode(self.taskInfo,forKey:"info")
        aCoder.encode(self.remaindarTime, forKey: "time")
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
        task.remaindarTime = remaindarTime;
        task.wirteDefaultByStep(step)
        return task;
    }
    
    func wirteDefaultByStep(_ step:Int){ //按照步骤创建文件
        MusicCreateManger.main.writeDefault(step);
    }
    
    func play(){
        switch taskStyle {
        case .autoFire:
            let step = (taskInfo as! NSDictionary).value(forKey: "step") as! Int
            let path = TaskManager.singleton.getDefaultFilePath(step)
            MusicPlayer.shared.play(path,time:self.remaindarTime)
            break;
        case .customFire:
            break;
        case .localFire:
            break;
        }
        self.run()
    }
    
    func run(){ //定时开始计时
        schedulerDispos = self.scheduler.schedule(after:self.scheduler.currentDate, interval: DispatchTimeInterval.seconds(2)) {
            self.remaindarTime = self.remaindarTime - 1
        }
    }
    
    func pause(){ //暂停计时
        MusicPlayer.shared.stop()
        schedulerDispos.dispose()
    }
}
