//
//  PlistManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

class PlistManger :NSObject{
    var taskStepInfoDic:NSDictionary?
    static let share:PlistManger = PlistManger()
    var stepPath:String
    
    private override init() {
        taskStepInfoDic = NSDictionary.init()
        let docs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        stepPath = docs[0]
    
        super.init()
    }
    
    func save() -> Void {
        
    }
    
    func step(_ i:Int) -> TaskStepInfo? {
        return taskStepInfoDic?[i] as? TaskStepInfo
    }
}
