//
//  DealDataManager.swift
//  Deal
//
//  Created by Do Kwon on 4/14/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation

class DealDataManager {
    
    var deals : [Deal]
    
    init () {
        self.deals = []
    }
    
    func saveDeals () {
        for deal in self.deals {
            
            
        }
        
    }
    
    func addDeal (deal_info :Deal) {
        NSUserDefaults.standardUserDefaults().setObject("apistringhere", forKey: "apikey")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func removeDeal (deal_info :Deal) {
        NSUserDefaults.standardUserDefaults().objectForKey("apikey")
        //deals.append(deal_info);
    }
}