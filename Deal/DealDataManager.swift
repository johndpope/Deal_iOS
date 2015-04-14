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
        /*for i in (0 .. self.deals.count) {
            deal = self.deals [i]
            key = "deal" + String(i)
            NSUserDefaults.standardUserDefaults().setObject(deal.task, forKey: key + "task")
            NSUserDefaults.standardUserDefaults().setObject(deal.reward, forKey: key + "reward")
            NSUserDefaults.standardUserDefaults().setObject(deal.complete, forKey: key + "complete")
            NSUserDefaults.standardUserDefaults().setObject(deal.task, forKey: key + "task")
            
        }*/
        
    }
    
    
    func addDeal (deal_info :Deal) {
        deals.append(deal_info)
    }
    
    func removeDeal (deal_info :Deal) {
        NSUserDefaults.standardUserDefaults().objectForKey("apikey")
        //deals.rem
        //deals.append(deal_info);
    }
}