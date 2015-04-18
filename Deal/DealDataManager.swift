//
//  DealDataManager.swift
//  Deal
//
//  Created by Do Kwon on 4/14/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation
import CoreData

class DealDataManager {
   
    
    //var cur_user : DealUser
    
    
    /* Cached version */
    //var deals : [NSManagedObject]
    var deals : [Deal]
    var deal_users : [String : DealUser]
    
    init () {
        self.deals = []
        
        deal_users = Dictionary<String, DealUser>()
    }
    
    /*func fetchDeals (appDelegate : AppDelegate) {
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Deal")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as! [NSManagedObject]?
        
        if let results = fetchedResults {
            deals = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
    }*/
    
 
    func find_user (user_id : String) -> DealUser {
        assert (user_id != "", "DealDataManager -> find_user : nil user id")
        return deal_users[user_id]!
    }
    
    func add_user (deal_user : DealUser) -> Void {
        deal_users[deal_user.id] = deal_user
    }
    
    
    func getDealForIndex (index : Int) ->Deal {
        //println (String(deals))
        var deal_obj = deals [index]
        /*let type_int = Deal.int_to_type(deal_obj.valueForKey("type") as! Int)
        var deal = Deal(task: deal_obj.valueForKey("task") as! String,
            reward: deal_obj.valueForKey("reward") as! String, deal_type: type_int)*/
       return deal_obj
    }
    
    func saveDeal(deal : Deal) {
    //func saveDeal(deal : Deal, appDelegate : AppDelegate) {
        /*let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Deal",
            inManagedObjectContext:
            managedContext)
        
        let deal_obj = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        deal_obj.setValue(deal.task, forKey: "task")
        deal_obj.setValue(deal.reward, forKey: "reward")
        deal_obj.setValue(Deal.type_to_int(deal.deal_type), forKey: "type")
        deal_obj.setValue(deal.complete, forKey: "completed")
        
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        //5
        deals.append(deal_obj)
        */
        deals.append(deal)
    }
    

}