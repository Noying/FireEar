//
//  TaskManager.swift
//  FireEar
//
//  Created by roy on 2018/11/12.
//  Copyright © 2018 Iceroy. All rights reserved.
//

import Foundation

class TaskManager: NSObject {
    static let singleton = TaskManager()
    var taskRunInWhereLast:TaskRunInWhere!
    override init() {
        super.init()
    }

    func getDefaultFilePath(_ step:Int) -> String {
        let filePath = SystemMacro.getDocumentsPath() + String.init(format: "/step%d.wav", step);
        return filePath;
    }
}
