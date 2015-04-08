//
//  DealInfo.swift
//  Deal
//
//  Created by Do Kwon on 4/5/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation


class DealInfo {
    var task : String = ""
    var reward : String = ""
    var complete : Bool
    
    init () {
        task = ""
        reward = ""
        complete = false;
    }
    
    func setTask (new_task : String) {
        self.task = new_task
    }
    
    func setReward (new_reward : String) {
        self.reward = new_reward
    }
    
    func setComplete () {
        self.complete = true
    }
}