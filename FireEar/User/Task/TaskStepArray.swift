//
//  TaskStepArray.swift
//  FireEar
//
//  Created by roy on 2018/11/12.
//  Copyright © 2018 Iceroy. All rights reserved.
//

import Foundation

class TaskStepArray:NSObject{
    var stepArray:NSMutableArray!
    static let singleton = TaskStepArray();
    override init() {
        super.init();
        let step0:NSDictionary = ["startFreq":100,"endFreq":15000,"stepName":"舒筋阶段","stepTime":12,"vol":0.2,"sweeptime":5];
        let step1:NSDictionary = ["startFreq":50,"endFreq":18000,"stepName":"通络阶段","stepTime":12,"vol":0.3,"sweeptime":3];
        let step2:NSDictionary = ["startFreq":20,"endFreq":20000,"stepName":"习武阶段","stepTime":72,"vol":0.5,"sweeptime":2];
        let step3:NSDictionary = ["startFreq":18,"endFreq":22000,"stepName":"打擂阶段","stepTime":24,"vol":0.7,"sweeptime":1];
        self.stepArray = NSMutableArray();
        self.stepArray.add(step0);
        self.stepArray.add(step1);
        self.stepArray.add(step2);
        self.stepArray.add(step3);
    }
    
    
    
}
