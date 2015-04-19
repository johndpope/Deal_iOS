//
//  LoginViewController.swift
//  Deal
//
//  Created by Do Kwon on 4/17/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import UIKit

class LoginViewContoller :UIViewController, FBSDKLoginButtonDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginView : FBSDKLoginButton = FBSDKLoginButton()
        self.view.addSubview(loginView)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        loginView.frame = CGRectMake((screenWidth-loginView.frame.size.width)/2, screenHeight-loginView.frame.size.height-130, loginView.frame.size.width, loginView.frame.size.height)
        loginView.readPermissions = ["public_profile", "email", "user_friends"]
        loginView.delegate = self
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if ((error) != nil)
        {
            println(error)
        }
        else if result.isCancelled {
            // Handle cancellations
            println(result.token)
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                self.dismissViewControllerAnimated(false, completion: nil)
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
}
