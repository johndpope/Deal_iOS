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
    
    @IBAction func me_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.ME_FILTER_TYPE)
        self.tableView.reloadData()
    }
    @IBAction func family_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.FAMILY_FILTER_TYPE)
        self.tableView.reloadData()
    }
    @IBAction func friends_filter_pressed(sender: AnyObject) {
        filter_deals (Deal.FilterType.FRIENDS_FILTER_TYPE)
        self.tableView.reloadData()
        
    }
    let dealCellIdentifier = "DealDetailCellIdentifier"
    
    var filtered_deals = [Deal]()

    func filter_deals(type : Deal.FilterType) {
        
        filtered_deals = []
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in appDelegate.deal_data_manager.deals{
            if deal.type == type {
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
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(dealCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = filtered_deals[row].task
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println ("NOT IMPLEMENTED YET")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("dealDetail", sender: tableView)
        let row = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        /*if segue.identifier == "candyDetail" {
            let candyDetailViewController = segue.destinationViewController as UIViewController
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredCandies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.candies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
            }
        }*/
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        // Sample Data for candyArray
        // TODO: add real data to all_deals
        var all_deals = [Deal(task: "Clean the house", reward: "Get Candy", type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Kiss your mom", reward: "Get money", type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Pick up grandma", reward: "Get licorice", type: Deal.FilterType.FRIENDS_FILTER_TYPE),
        Deal(task: "Do homework", reward: "Get Xbox", type: Deal.FilterType.ME_FILTER_TYPE),
        Deal(task: "Practice Piano", reward: "Get stoned", type: Deal.FilterType.FAMILY_FILTER_TYPE),
        Deal(task: "Practice guitar", reward: "Get game gold", type: Deal.FilterType.FRIENDS_FILTER_TYPE)
        ]
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in all_deals {
            appDelegate.deal_data_manager.addDeal(deal)
        }
        
        filtered_deals = all_deals
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: dealCellIdentifier)
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
