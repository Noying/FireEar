//
//  TaskStepInfo.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

class TaskStepInfo: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.taskStep, forKey: "taskStep")
        aCoder.encode(self.taskStepName, forKey: "taskStepName")
        aCoder.encode(self.taskStepInfo, forKey: "taskStepInfo")
        aCoder.encode(self.taskTime, forKey: "taskTime")
        aCoder.encode(self.musicPcmList, forKey: "musicPcmList")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.taskStep = aDecoder.decodeObject(forKey: "taskStep") as? UInt
        self.taskStepName = aDecoder.decodeObject(forKey: "taskStepName") as? String
        self.taskStepInfo =  aDecoder.decodeObject(forKey: "taskStepInfo") as? String
        self.taskTime = aDecoder.decodeObject(forKey: "taskTime") as? UInt
        self.musicPcmList =  aDecoder.decodeObject(forKey: "musicPcmList") as? Array<MusicDuration>
    }
    
    var taskStep:UInt?
    var taskStepName:String?
    var taskStepInfo:String?
    var taskTime:UInt?
    var musicPcmList:Array<MusicDuration>? //都以20秒为准，startTime:0.0s endTime:20.0s freq:450.0HZ vol:(0~1)
    
    override init() {
        super.init()
    }
    
    
}
