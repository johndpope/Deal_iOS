//
//  User.swift
//  Deal
//
//  Created by Ki Suk Jang on 4/16/15.
//  Copyright (c) 2015 Do Kwon. All rights reserved.
//

import Foundation

class User : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var User_Id : String = ""
    var First_Name : String = ""
    var Last_Name : String = ""
    var Phone_Num  : String = ""
    
    override init!() { super.init() }
    
    init (id : String, first_name:String, last_name:String) {
        super.init()
        self.User_Id = id
        self.First_Name = first_name
        self.Last_Name = last_name
    }
    
    required init!(coder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func dynamoDBTableName() -> String! {
        return "User"
    }
    class func hashKeyAttribute() -> String! {
        return "User_Id"
    }
    /*class func rangeKeyAttribute() -> String! {
    return ""
    }*/
    
    //required to let DynamoDB Mapper create instances of this class
    override init(dictionary dictionaryValue: [NSObject : AnyObject]!, error: NSErrorPointer) {
        super.init(dictionary: dictionaryValue, error: error)
    }
    
    //workaround to possible XCode 6.1 Bug : "Type NotificationAck" does not conform to protocol "NSObjectProtocol"
    override func isEqual(anObject: AnyObject?) -> Bool {
        return super.isEqual(anObject)
    }
}