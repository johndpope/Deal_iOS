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
    
    func populate_with_data (deal : Deal) {
        println ("error prone function called")
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