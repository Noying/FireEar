//
//  TaskStepInfo.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class TaskStepInfo: NSObject {
    var taskStep:UInt?
    var taskStepName:String?
    var taskStepInfo:String?
    var taskTime:UInt?
    var musicPcmList:NSArray? //都以20秒为准，startTime:0.0s endTime:20.0s freq:450.0HZ vol:(0~1)
    
    override init() {
        super.init()
    }
}
