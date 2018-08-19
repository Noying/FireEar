//
//  TaskInfo.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

enum TaskStyle{
    case auto
    case diy
}

class TaskInfo: NSObject {
    var isDiy:Bool
    var taskName:String?
    var taskRemindarTime:UInt?
    var taskTime:UInt?
    var taskMusicPath:[String]?
    var taskStyle:TaskStyle
    var taskStep:UInt
    
    override init() {
        self.isDiy = false
        self.taskStyle = .auto
        self.taskStep = 0
        
        super.init()
    }
    
    static func defaultTask() -> TaskInfo {
        let defaultTask = TaskInfo.init()
        let taskStepInfoNo1 = PlistManger.share.step(0)!
        defaultTask.taskName = taskStepInfoNo1.taskStepName
        defaultTask.taskTime = taskStepInfoNo1.taskTime
        defaultTask.taskRemindarTime = taskStepInfoNo1.taskTime
        defaultTask.taskStyle = .auto
        defaultTask.taskStep = 0
        
        //TODO: 做20秒的音乐
        return defaultTask
    }
}
