//
//  ProfileViewController.swift
//  Deal
//
//  Created by Do Kwon on 4/16/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var profile_name_view: UITextView!
    @IBOutlet weak var profile_image: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        //select_user =
        filtered_deals = []
        super.init(coder: aDecoder)
    }
    
    
    @IBOutlet weak var back_btn: UIButton!
    
    @IBAction func back_btn_pressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    var select_user : User?
    var filtered_deals : [Deal] = []
    
    func get_deals_for_user() {
        //assert (select_user != nil, "Selected user is nil.")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        for deal in appDelegate.deal_data_manager!.deals {
            // Is the select user's deal
            if deal.Dealer_Id == select_user!.User_Id || deal.Dealee_Id == select_user!.User_Id {
                filtered_deals.append (deal)
            }
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        get_deals_for_user ()
        tableView.dataSource = self
        tableView.delegate = self
        profile_name_view.text = select_user?.getFullName()
        self.tableView.reloadData()
        
        profile_image.layer.cornerRadius = profile_image.frame.size.height / 2;
        profile_image.clipsToBounds = true
        profile_image.layer.borderWidth = 0.5
        profile_image.layer.borderColor = UIColor.blackColor().CGColor
        profile_image.image = UIImage(data: select_user!.Profile_Photo!)
        
        // Do any additional setup after loading the view.
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
        var cell = tableView.dequeueReusableCellWithIdentifier(profile_deal_cell_identifier, forIndexPath: indexPath)as? ProfileCustomTableCell
        if (cell == nil) {
            cell = ProfileCustomTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: profile_deal_cell_identifier)
        }
        let row = indexPath.row
        cell!.populate_with_data(filtered_deals[row])
        return cell!
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*println ("NOT IMPLEMENTED YET")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(deal_detail_segue_identifer, sender: tableView)
        let row = indexPath.row*/
    }
}
