//
//  DealCustomTableCell.swift
//  Deal
//
//  Created by Do Kwon on 4/14/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit

class DealCustomTableCell: UITableViewCell {
    
    @IBOutlet weak var task_label: UILabel!
    @IBOutlet weak var reward_label: UILabel!
    @IBOutlet weak var participant_label: UILabel!
    @IBOutlet weak var profile_image: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var deal : Deal?
    
    func generate_deal_string (deal:Deal)-> String {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dealer = appDelegate.deal_data_manager?.find_user(deal.Dealer_Id)
        let dealee = appDelegate.deal_data_manager?.find_user(deal.Dealee_Id)
        var r_str = "You "
        if deal.Type != Deal.FilterType.ME_FILTER_TYPE {
            r_str = dealer!.First_Name + " "
        }
        r_str = r_str +  " made a deal with " + dealee!.First_Name
        return r_str
    }
    
    
    @IBAction func profile_picture_pressed(sender: AnyObject) {
        let rootViewController = self.window!.rootViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dealee = appDelegate.deal_data_manager?.find_user(self.deal!.Dealee_Id)
        let alertController = UIAlertController(title: nil, message: "Pick option", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Show Profile", style: .Default) { (action) in
            let rootViewController = self.window!.rootViewController
            rootViewController!.performSegueWithIdentifier(show_profile_segue_identifier, sender: dealee)
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Make Deal", style: .Default) { (action) in
            let rootViewController = self.window!.rootViewController
            rootViewController!.performSegueWithIdentifier(specific_make_deal_segue_identifier, sender: dealee)
        }
        alertController.addAction(destroyAction)
        
        rootViewController!.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func populate_with_data (deal : Deal) {
        profile_image.layer.cornerRadius = profile_image.frame.size.height / 2;
        profile_image.clipsToBounds = true
        profile_image.layer.borderWidth = 0.5
        profile_image.layer.borderColor = UIColor.blackColor().CGColor
        
        self.deal = deal
        task_label.text = deal.Task
        reward_label.text = deal.Reward
        participant_label.text = generate_deal_string (deal)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let curr_user = appDelegate.deal_data_manager?.cur_user
        var other_id = deal.getDealerId()
        if (other_id == curr_user?.User_Id){
            other_id = deal.getDealeeId()
        }
        
        let other_user = appDelegate.deal_data_manager?.deal_users[other_id]
        profile_image.setImage(UIImage(data: other_user!.Profile_Photo!), forState: .Normal)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}