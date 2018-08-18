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
    var taskName:String
    var taskRemindarTime:UInt
    var taskTime:UInt
    var taskMusicPath:String
    var taskStyle:TaskStyle
    var taskStep:UInt
    
    override init() {
        self.isDiy = false
        self.taskName = ""
        self.taskRemindarTime = UInt.max
        self.taskTime = UInt.max
        self.taskMusicPath = ""
        self.taskStyle = .auto
        self.taskStep = 0
        
        super.init()
    }
}
