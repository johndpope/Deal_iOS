//
//  DealData.swift
//  Deal
//
//  Created by Do Kwon on 4/5/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation


class DealData {
    
    func addDeal (deal_info :DealInfo) {
        NSUserDefaults.standardUserDefaults().setObject("apistringhere", forKey: "apikey")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func removeDeal (deal_info :DealInfo) {
        NSUserDefaults.standardUserDefaults().objectForKey("apikey")
        //deals.append(deal_info);
    }
}