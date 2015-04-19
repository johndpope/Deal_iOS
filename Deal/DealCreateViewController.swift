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
        self.new_deal = Deal(task : "", reward :"", deal_type: Deal.FilterType.ME_FILTER_TYPE, dealer_id : "", dealee_id : "")
        super.init(coder: aDecoder)
    }

    var new_deal : Deal
    
    var dealee : User?
    
    func set_delee (user1: User) {
        self.dealee = user1
    }
    
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
        new_deal.Task = new_task
    }
    @IBAction func exit_pressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func rewardEntered(sender: AnyObject) {
        let new_reward = rewardTextField.text
        //new_deal.setReward(new_reward)
        new_deal.Reward = new_reward
    }
    
    @IBAction func parentAgreed(sender: AnyObject) {
        parent_agreed = true
        parentAgreeBtn.selected = true
    }
    
    @IBAction func kidAgreed(sender: AnyObject) {
        kid_agreed = true
        kidAgreeBtn.selected = true
    }
    
    @IBAction func makeDealBtnPressed(sender: AnyObject) {
        var errorMessage : String = ""
        if (rewardTextField.text == "" || taskTextField.text == "") {
            errorMessage = "You must enter both a task an a reward. Complete missing fields."
        } else {
            if (parent_agreed && kid_agreed) {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.deal_data_manager!.saveDeal(new_deal)
                self.dismissViewControllerAnimated(true, completion: nil)
                return
            } else {
                 errorMessage = "You must enter both a task an a reward. Complete missing fields."
            }
        }
        var alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
