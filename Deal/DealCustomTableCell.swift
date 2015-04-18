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
    
    @IBAction func profile_picture_pressed(sender: AnyObject) {
        let rootViewController = self.window!.rootViewController
        let alertController = UIAlertController(title: nil, message: "Pick option", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Show Profile", style: .Default) { (action) in
            let rootViewController = self.window!.rootViewController
            rootViewController!.performSegueWithIdentifier(show_profile_segue_identifier, sender: sender)
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Make Deal", style: .Default) { (action) in
            let rootViewController = self.window!.rootViewController
            rootViewController!.performSegueWithIdentifier(specific_make_deal_segue_identifier, sender: sender)
        }
        alertController.addAction(destroyAction)
        
        rootViewController!.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func populate_with_data (deal : Deal) {
        println (deal.Task)
        if (task_label == nil) {
            println ("Found nil!")
        }
        task_label.text = deal.Task
        reward_label.text = deal.Reward
        participant_label.text = "PARTICIPANT"
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}