//
//  KeyChainManger.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit

class KeyChainManger: NSObject {
    var diyRemindar:Int = Int.max
    static let share = KeyChainManger()
    private override init() {
        super.init()
    }
    
}
