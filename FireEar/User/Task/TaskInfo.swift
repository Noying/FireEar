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
        let step = PlistManger.share.step(0)!
        defaultTask.taskName = step.stepName
        defaultTask.taskTime = step.stepTime
        defaultTask.taskRemindarTime = step.stepTime
        defaultTask.taskStyle = .auto
        defaultTask.taskStep = 0
        
        //TODO: 做20秒的音乐
        MusicCreateManger.main.writeDefault(step: step)
        defaultTask.taskMusicPath = [step.getMusicPath()]
        return defaultTask
    }
    
    static func getRemindarShowText(time:UInt) -> String {
        let second = time%60
        let minute = (time-second)%3600
        let hour = (time-second-60*minute)/3600
        let remText = String(format:"所剩时间:%02d:%02d:%02d",hour,minute,second)
        return remText
    }
}
