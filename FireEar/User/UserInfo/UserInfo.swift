//
//  UserInfo.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/19.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    var taskList = PlistManger.share.taskList
    var diyReminder:Int = KeyChainManger.share.diyRemindar
    
    
}
