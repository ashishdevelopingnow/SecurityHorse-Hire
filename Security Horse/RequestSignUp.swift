//
//  RequestSignUp.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 04/01/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class RequestSignUp: RequestClass {

    static func signInProcessFirst(_ company_email : String ,company_phone : String ,company_name : String, result :  Completion?){
        //        http://35.166.163.212/apis/getAllJobs
        //        Params : {"offset":0}
//        "company_email":"ppp@gmail.com",
//        "company_no":"234234234",
//        "company_name":"ABC LTD"}
        
        let dict : Dictionary =
            [
                "company_email" : company_email as AnyObject,
                "company_no" : company_phone as AnyObject,
                "company_name" : company_name as AnyObject
        ]
        //        if let user_id = userId {
        //            dict["user_id"] = user_id as AnyObject?
        //        }
        print("dictionarryyyyy  ::::: %@",dict)
        let url = apis.baseURL + apis.signUp1
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
            //            result?(response, error, success)
            guard success == true else {
                result?(nil,error,false)
                return
            }
            if let dict = response as? [String : AnyObject] {
//                let mapper = Mapper<Jobs>().map(JSONObject: dict)
                //                let mapper = Mapper<Jobs>().map(_, response)
                result?(dict as AnyObject?,error,true)
                //                if let resp = dict["response"] as? [String : AnyObject], let jobs = resp["jobs"] as? [AnyObject] {
                ////                    Utils.showAlert(withMessage: message)
                //
                //                }
            }else{
                result?(nil,error,false)
            }
        }
        
        
    }
    
    static func signInProcessSecond(_ company_email : String ,company_phone : String ,company_name : String, name : String , email : String , mobileNo : String , result :  Completion?){
//        "company_email":"ppp@gmail.com",
//        "company_no":"234234234",
//        "company_name":"ABC LTD",
//        "full_name":"Pravesh Kumar",
//        "email":"cc111c@gmail.com",
//        "mobile_number":"22323232"
        
        let dict : Dictionary =
            [
                "company_email" : company_email as AnyObject,
                "company_no" : company_phone as AnyObject,
                "company_name" : company_name as AnyObject,
                
                
                "full_name" : name as AnyObject,
                "email" : email as AnyObject,
                "mobile_number" : mobileNo as AnyObject,
        ]
        //        if let user_id = userId {
        //            dict["user_id"] = user_id as AnyObject?
        //        }
        print("dictionarryyyyy  ::::: %@",dict)
        let url = apis.baseURL + apis.signUp2
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
            //            result?(response, error, success)
            guard success == true else {
                result?(nil,error,false)
                return
            }
            if let dict = response as? [String : AnyObject] {
                
                
//                    if let dict3 = dict["data"] as? [String : AnyObject]  {
//                        UserDefault.saveUserInfo(dict3)
//                }
                //                let mapper = Mapper<Jobs>().map(JSONObject: dict)
                //                let mapper = Mapper<Jobs>().map(_, response)
                result?(dict as AnyObject?,error,true)
                if let message = dict["message"] as? String{
                    
                    UtilsSwift.showAlertWithMessage(message, nil)
                    //                    Utils.showAlert(withMessage: message,andTitle: nil)
                }else
                    if let message = dict["msg"] as? String{
                        
                        UtilsSwift.showAlertWithMessage(message, nil)
                        //                    Utils.showAlert(withMessage: message,andTitle: nil)
                }
            }else{
                result?(nil,error,false)
            }
        }
        
        
    }
    
    static func signInWithParameter(_ email : String ,password : String, result :  Completion?){
//        http://35.166.163.212/apis/signin
//        Params
//        {"email":"vikas123@developingnow.com","password":"123456"}
        let dict =
        [
            "email" : email,
            "password" : password
        ]
        let url = apis.baseURL + apis.signin
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
            
            guard success == true else {
                
                result?(response, error, false)
                return
            }
            if let dict = response as? [String : AnyObject] {
                if let dict3 = dict["data"] as? [String : AnyObject]  {
                    UserDefault.saveUserInfo(dict3)
                    
                    if let message = dict["message"] as? String{
                        UIApplication.shared.keyWindow?.makeToast(message)
//                        UtilsSwift.showAlertWithMessage(message, nil)
//                        Utils.showAlert(withMessage: message,andTitle: nil)
                    }
                    result?(response, error, success)
                    return
                }
                
            }
            result?(response, error, false)
            
        }
        
        
    }
    
    static func forgotPassword(_ email : String , result :  Completion?){
        //        http://35.166.163.212/apis/signin
        //        Params :
        //        {"email":"pravesh@developingnow.com","password":"123456"}
        
//        1. http://35.166.163.212/apis/forgotPassword
        let dict =
            [
                "email" : email
        ]
        let url = apis.baseURL + apis.forgotPassword
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
            result?(response, error, success)
            guard success == true else {
                return
            }
            if let dict = response as? [String : AnyObject] {
                
                if let message = dict["message"] as? String{
                    
                    UtilsSwift.showAlertWithMessage(message, nil)
//                    Utils.showAlert(withMessage: message,andTitle: nil)
                }else
                if let message = dict["msg"] as? String{
                    
                    UtilsSwift.showAlertWithMessage(message, nil)
//                    Utils.showAlert(withMessage: message,andTitle: nil)
                }
            }
        }
        
        
    }
    
    
    

}
