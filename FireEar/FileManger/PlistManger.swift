//
//  PlistManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

class PlistManger :NSObject{
    var taskStepInfoDic:NSArray?
    var taskList:NSArray?
    static let share:PlistManger = PlistManger()
    
    private override init() {
        //let docs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let stepPath = Bundle.main.path(forResource: "stepDic", ofType: "plist")!;
        taskStepInfoDic = NSArray.init(contentsOf: URL.init(fileURLWithPath:stepPath))
        super.init()
    }
    
    func save() -> Void {
        
    }
    
    func step(_ i:Int) -> TaskStepInfo? {
        let step = TaskStepInfo.init()
        return step
    }
}
