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
    
    let show_profile_segue_identifier = "show_profile"
    let specific_make_deal_segue_identifier = "specific_make_deal"
    let deal_detail_segue_identifer = "deal_detail"
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println ("NOT IMPLEMENTED YET")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(deal_detail_segue_identifer, sender: tableView)
        let row = indexPath.row
    }
    
    @IBAction func profile_picture_pressed(sender: AnyObject) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Show profile", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier(self.show_profile_segue_identifier, sender: sender)
        })
        let saveAction = UIAlertAction(title: "Make Deal", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
             self.performSegueWithIdentifier(self.specific_make_deal_segue_identifier, sender: sender)
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == self.specific_make_deal_segue_identifier{
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
        } else if segue.identifier == self.show_profile_segue_identifier {
            
        } else if segue.identifier == self.deal_detail_segue_identifer {
            
            
        } else {
            println ("ERROR: not working")
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        filter_deals (Deal.FilterType.ME_FILTER_TYPE)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        // TODO: add real data to all_deals
        var all_deals = [Deal(task: "Clean the house", reward: "Get Candy", deal_type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Kiss your mom", reward: "Get money", deal_type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Pick up grandma", reward: "Get licorice", deal_type: Deal.FilterType.FRIENDS_FILTER_TYPE),
        Deal(task: "Do homework", reward: "Get Xbox", deal_type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Practice Piano", reward: "Get stoned", deal_type: Deal.FilterType.FAMILY_FILTER_TYPE),
        Deal(task: "Practice guitar", reward: "Get game gold", deal_type: Deal.FilterType.FRIENDS_FILTER_TYPE)
        ]
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in all_deals {
            appDelegate.deal_data_manager!.saveDeal(deal)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        me_filter_btn.selected = true
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
