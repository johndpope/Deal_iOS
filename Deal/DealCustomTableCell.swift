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
        var rootViewController = self.window!.rootViewController
        let alertController = UIAlertController(title: nil, message: "Pick option", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Show Profile", style: .Default) { (action) in
            println("dd")
            //rootViewController.performSegueWithIdentifier(self.show_profile_segue_identifier, sender: sender)
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Make Deal", style: .Default) { (action) in
            println("dd")
            //rootViewController.performSegueWithIdentifier(self.specific_make_deal_segue_identifier, sender: sender)
        }
        alertController.addAction(destroyAction)
        
        rootViewController!.presentViewController(alertController, animated: true) {
            // ...
        }
        //present the alert:
        //rootViewController!.presentViewController(alert, animated: true, completion: nil)
        // 1
        /*let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Show profile", style: UIAlertActionStyle.Default, handler: {
            (alert: UIAlertAction!) -> Void in
        
        })
        let saveAction = UIAlertAction(title: "Make Deal", style: UIAlertActionStyle.Default, handler: {
            (alert: UIAlertAction!) -> Void in
        
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        rootViewController!.presentViewController(optionMenu, animated: true, completion: nil)*/
    }
    
    /*
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        parent_view_controller = nil
    }*/
    
    func populate_with_data (deal : Deal) {
        println (deal.task)
        if (task_label == nil) {
            println ("Found nil!!")
        }
        task_label.text = deal.task
        reward_label.text = deal.reward
        participant_label.text = "PARTICIPANT"
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}