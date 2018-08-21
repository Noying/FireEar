//
//  MusicDuration.swift
//  FireEar
//
//  Created by 罗英 on 2018/8/19.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import Cocoa

class MusicDuration: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(startTime, forKey: "startTime")
        aCoder.encode(endTime, forKey: "endTime")
        aCoder.encode(freq, forKey: "freq")
        aCoder.encode(vol, forKey: "vol")
    }
    
    required init?(coder aDecoder: NSCoder) {
        startTime = aDecoder.decodeDouble(forKey: "startTime")
        endTime = aDecoder.decodeDouble(forKey: "endTime")
        freq = aDecoder.decodeDouble(forKey: "freq")
        vol = aDecoder.decodeDouble(forKey: "vol")
    }
    
    var startTime:Double?
    var endTime:Double?
    var freq:Double? //频率
    var vol:Double?  //相对可听的最大值的百分比，设为0.8
    
}
