//
//  TaskStepInfo.swift
//  FireEar
//
//  Created by roy on 2018/8/18.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Foundation

//自动煲机都使用扫频煲机
class TaskStepInfo: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(startFreq, forKey: "startFreq")
        aCoder.encode(endFreq, forKey: "endFreq")
        aCoder.encode(stepName, forKey: "stepName")
        aCoder.encode(stepName, forKey: "stepTime")
        aCoder.encode(vol, forKey: "vol")
        aCoder.encode(sweeptime, forKey: "sweeptime")
    }
    
    required init?(coder aDecoder: NSCoder) {
        startFreq = aDecoder.decodeDouble(forKey: "startFreq")
        endFreq = aDecoder.decodeDouble(forKey: "endFreq")
        stepName = aDecoder.decodeObject(forKey: "stepName") as? String
        stepTime = aDecoder.decodeObject(forKey: "stepTime") as? UInt
        vol = aDecoder.decodeDouble(forKey: "vol")
        sweeptime = aDecoder.decodeDouble(forKey: "sweeptime")
    }
    
    var startFreq:Double?
    var endFreq:Double?
    var stepName:String?
    var stepTime:UInt?
    var vol:Double?
    var sweeptime:Double?
    
    override init() {
        super.init()
    }
    
    public convenience init(dic:NSDictionary){
        self.init()
    }
}
