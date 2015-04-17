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
    var deal_type : FilterType
    var complete : Bool
    /*var incipient : DealUser = nil
    var recipient : DealUser = nil
    var complete_timestamp : time_value_t = nil
    var proposed_timestamp : time_value_t = nil*/
    
    init (task : String, reward :String, deal_type: FilterType) {
        self.task = task
        self.reward = reward
        complete = false;
        self.deal_type = deal_type
    }
    
    
    class func type_to_int (type : FilterType) ->Int{
        switch (type) {
        case FilterType.ME_FILTER_TYPE :
            return 0
        case FilterType.FAMILY_FILTER_TYPE :
            return 1
        case FilterType.FRIENDS_FILTER_TYPE :
            return 2
        }
    }
    class func int_to_type (stored_type : Int) ->FilterType{
        switch (stored_type) {
        case 0:
            return FilterType.ME_FILTER_TYPE
        case 1 :
            return FilterType.FAMILY_FILTER_TYPE
        case 2:
            return FilterType.FRIENDS_FILTER_TYPE
        default :
            return  FilterType.ME_FILTER_TYPE
        }
    }
    

}