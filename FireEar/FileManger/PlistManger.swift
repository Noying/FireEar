//
//  PlistManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

class PlistManger :NSObject{
    var taskStepInfoArray:Array<Any>?
    var taskList:Array<Any>?
    static let share:PlistManger = PlistManger()
    
    private override init() {
        super.init()
        self.loadStep()
    }
    
    func loadStep()->Void{
        let stepPath = Bundle.main.path(forResource: "stepDic", ofType: "plist")!;
        let array = NSArray.init(contentsOfFile: stepPath)
        taskStepInfoArray = array as? Array<Any>
    }
    
    func save() -> Void {
        
    }
    
}
