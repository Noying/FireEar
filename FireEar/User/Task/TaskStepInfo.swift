//
//  TaskStepInfo.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class TaskStepInfo: NSObject {
    var taskStep:UInt
    var taskStepName:String
    var taskStepInfo:String
    
    override init() {
        taskStep = 0
        taskStepName = ""
        taskStepInfo = ""
    }
}
