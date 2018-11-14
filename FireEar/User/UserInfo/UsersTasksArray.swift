//
//  UsersTasksArray.swift
//  FireEar
//
//  Created by roy on 2018/11/14.
//  Copyright © 2018 Iceroy. All rights reserved.
//

import Foundation

class UsersTasksArray: NSObject {
    static let main = UsersTasksArray();
    var tasks:NSMutableArray!
    
    func writeToFile() {
        //写入文件
        let path = SystemMacro.getDocumentsPath() + "/tasks.plist";
        tasks.write(toFile: path, atomically: true)
    }
    
    func readFromFile()  {
        //读取文件
         let path = SystemMacro.getDocumentsPath() + "/tasks.plist";
         self.tasks = NSMutableArray(contentsOfFile: path);
    }
}
