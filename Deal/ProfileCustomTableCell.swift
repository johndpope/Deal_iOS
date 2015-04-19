
//
//  ProfileCustomTableCell.swift
//  Deal
//
//  Created by Do Kwon on 4/18/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit

class ProfileCustomTableCell : UITableViewCell {
    
    
    @IBOutlet weak var reward_label: UILabel!
    @IBOutlet weak var task_label: UILabel!
    
    @IBOutlet weak var participant_label: UILabel!
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
    
    

    
    func populate_with_data (deal : Deal) {
        self.deal = deal
        task_label.text = deal.Task
        reward_label.text = deal.Reward
        participant_label.text = generate_deal_string (deal)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
