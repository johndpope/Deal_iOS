//
//  MainViewController.swift
//  Deal
//
//  Created by Do Kwon on 4/13/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit


class MainViewConroller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var me_filter_btn: UIButton!
    @IBOutlet weak var family_filter_btn: UIButton!
    @IBOutlet weak var friends_filter_btn: UIButton!
    
    func mark_filter_btn (type : Deal.FilterType) {
         var pressed_1 = false
         var pressed_2  = false
         var pressed_3 = false
        switch (type) {
            
            case Deal.FilterType.ME_FILTER_TYPE :
                pressed_1 = true
            break
            case Deal.FilterType.FAMILY_FILTER_TYPE :
                pressed_2 = true
            break
            
            case Deal.FilterType.FRIENDS_FILTER_TYPE :
                pressed_3 = true
            break
            
        }
        me_filter_btn.selected = pressed_1
        family_filter_btn.selected = pressed_2
        friends_filter_btn.selected = pressed_3
        
    }
    
    
    @IBAction func me_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.ME_FILTER_TYPE)
        mark_filter_btn(Deal.FilterType.ME_FILTER_TYPE)
        self.tableView.reloadData()
    }
    @IBAction func family_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.FAMILY_FILTER_TYPE)
         mark_filter_btn(Deal.FilterType.FAMILY_FILTER_TYPE)
        self.tableView.reloadData()
    }
    @IBAction func friends_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.FRIENDS_FILTER_TYPE)
         mark_filter_btn(Deal.FilterType.FRIENDS_FILTER_TYPE)
        self.tableView.reloadData()
        
    }
    let dealCellIdentifier = "DealDetailCellIdentifier"
    
    var filtered_deals = [Deal]()

    func filter_deals(type : Deal.FilterType) {
        
        filtered_deals = []
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in appDelegate.deal_data_manager!.deals {
            if deal.Type == type {
                filtered_deals.append(deal)
            }
            
        }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        // TODO: populate deals array from disk
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: AWSRegionType.USEast1, identityPoolId: "us-east-1:554fda00-ce9b-43ec-a01b-d2ee16436ded")
        
        let defaultServiceConfiguration = AWSServiceConfiguration(
            region: AWSRegionType.USEast1, credentialsProvider: credentialsProvider)
        
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = defaultServiceConfiguration
        
        
        /* get one example */
        
        let mapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        mapper.load(User.self, hashKey: "deal@stanford.edu", rangeKey: "2") .continueWithExecutor(BFExecutor.mainThreadExecutor(), withBlock: { (task:BFTask!) -> AnyObject! in
            if (task.error == nil) {
                if (task.result != nil) {
                    print(task.result)
                }
            } else {
                println("Error: \(task.error)")
                let alertController = UIAlertController(title: "Failed to get item from table.", message: task.error.description, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (action:UIAlertAction!) -> Void in
                })
                alertController.addAction(okAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            return nil
        })

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered_deals.count
        /*if tableView == self.searchController!.searchResultsTableView {
            return self.filtered_deals.count
        } else {
            return self.deals.count
        }*/
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(dealCellIdentifier, forIndexPath: indexPath)as? DealCustomTableCell
        if (cell == nil) {
            cell = DealCustomTableCell (style: UITableViewCellStyle.Default, reuseIdentifier: dealCellIdentifier)
        }
        let row = indexPath.row
        cell!.populate_with_data(filtered_deals[row])
        return cell!
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println ("NOT IMPLEMENTED YET")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(deal_detail_segue_identifer, sender: tableView)
        let row = indexPath.row
    }
    

    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if sender is UIButton {
            if identifier == specific_make_deal_segue_identifier ||  identifier == show_profile_segue_identifier {
                return false
            }
        }
        
        if identifier == login_segue_identifier {
            if logged_in {
                println ("%%%%%%%% Not Logging in !!")
                return false
            }
            ("%%%%%%%% Logging in !!")
           
        }
        return true
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == specific_make_deal_segue_identifier{
            let makeDealViewController = segue.destinationViewController as! UIViewController
            
            
            /*if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredCandies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.candies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
            }*/
        } else if segue.identifier == show_profile_segue_identifier {
            
        } else if segue.identifier == deal_detail_segue_identifer {
            
            
        } else {
            println ("ERROR: not working")
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if (!logged_in)  {
            //performSegueWithIdentifier (login_segue_identifier, sender:self)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("login_controller_id") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        
        filter_deals (Deal.FilterType.ME_FILTER_TYPE)
        self.tableView.reloadData()
    }
    
    var logged_in = false
    
    /* Testing function. remove later */
    func initialize_deal_data() {
        
        let user_1 = "1"
        let user_2 = "2"
        let user_3 = "3"
        
        let all_users = [DealUser (id: user_1, name: "Do"), DealUser (id: user_2, name: "Brian"), DealUser (id: user_3, name: "Cameron")]
        
        let all_deals = [Deal(task: "Clean the house", reward: "Get Candy", deal_type: Deal.FilterType.ME_FILTER_TYPE, dealer_id : user_1, dealee_id : user_2),
            Deal(task: "Kiss your mom", reward: "Get money", deal_type: Deal.FilterType.ME_FILTER_TYPE, dealer_id : user_1, dealee_id : user_3),
            Deal(task: "Pick up grandma", reward: "Get licorice", deal_type: Deal.FilterType.FRIENDS_FILTER_TYPE, dealer_id : user_2, dealee_id : user_3),
            Deal(task: "Do homework", reward: "Get Xbox", deal_type: Deal.FilterType.ME_FILTER_TYPE, dealer_id : user_1, dealee_id : user_3),
            Deal(task: "Practice Piano", reward: "Get stoned", deal_type: Deal.FilterType.FAMILY_FILTER_TYPE, dealer_id : user_3, dealee_id : user_2),
            Deal(task: "Practice guitar", reward: "Get game gold", deal_type: Deal.FilterType.FRIENDS_FILTER_TYPE, dealer_id : user_2, dealee_id : user_3)
        ]
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in all_deals {
            appDelegate.deal_data_manager!.saveDeal(deal)
        }
        
        for user in all_users {
            appDelegate.deal_data_manager!.add_user(user)
        }
    }

    
    override func viewDidLoad() {
        // TODO: add real data to all_deals
        
        //tableView.delegate = self
        //tableView.dataSource = self
        me_filter_btn.selected = true
        
        initialize_deal_data()
        
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
