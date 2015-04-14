//
//  DealCreateViewController.swift
//  Deal
//
//  Created by Do Kwon on 4/5/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit

class DealCreateViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        self.new_deal = Deal(task: "", reward: "", type: Deal.FilterType.ME_FILTER_TYPE)
        super.init(coder: aDecoder)
    }

    var new_deal : Deal
    
    var parent_agreed : Bool = false
    var kid_agreed : Bool = false
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var rewardTextField: UITextField!
    @IBOutlet weak var parentAgreeBtn: UIButton!
    @IBOutlet weak var kidAgreeBtn: UIButton!
    @IBOutlet weak var makeDealBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func taskEntered(sender: AnyObject) {
        
        let new_task = taskTextField.text
        new_deal.task = new_task
    }
    
    @IBAction func rewardEntered(sender: AnyObject) {
        let new_reward = rewardTextField.text
        //new_deal.setReward(new_reward)
        new_deal.reward = new_reward
    }
    
    @IBAction func parentAgreed(sender: AnyObject) {
        parent_agreed = true
    }
    
    @IBAction func kidAgreed(sender: AnyObject) {
        kid_agreed = true
    }
    
    @IBAction func makeDealBtnPressed(sender: AnyObject) {
        if (parent_agreed && kid_agreed) {
            //DealData().addDeal(new_deal)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
