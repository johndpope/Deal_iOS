//
//  Deal.swift
//  Deal
//
//  Created by Do Kwon on 4/13/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation

class Deal {
    
    enum FilterType {
        case ME_FILTER_TYPE
        case FAMILY_FILTER_TYPE
        case FRIENDS_FILTER_TYPE
    }
    
    var task : String
    var reward : String
    var type : FilterType
    var complete : Bool
    
    init (task : String, reward :String, type: FilterType) {
        self.task = task
        self.reward = reward
        complete = false;
        self.type = type
    }

}