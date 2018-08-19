//
//  PlistManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

class PlistManger :NSObject{
    var taskList:NSMutableArray?
    var taskStepInfoDic:NSDictionary?
    static let share:PlistManger = PlistManger()
    let listPath = SystemMacro.getDocumentsPath() + "/taskList.plist";
    let stepPath = SystemMacro.getDocumentsPath() + "/stepDic.plist";
    
    private override init() {
        taskList = NSMutableArray.init(contentsOfFile: listPath)
        taskStepInfoDic = NSDictionary.init(contentsOfFile: stepPath)
        super.init()
    }
    
    func save() -> Void {
        taskList?.write(toFile: listPath, atomically: true)
        taskStepInfoDic?.write(toFile: stepPath, atomically: true)
    }
    
    func step(_ i:Int) -> TaskStepInfo? {
        return taskStepInfoDic?[i] as? TaskStepInfo
    }
}
