//
//  RequestJobs.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 05/01/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit
import ObjectMapper
class RequestJobs: RequestClass {

    static func getssJobList(_ offset : Int ,userId : String , result :  Completion?){
        //        http://35.166.163.212/apis/getAllJobs
        //        Params : {"offset":0}
        let dict : Dictionary =
        [
//            "offset" : offset as AnyObject,
            "user_id" : userId as AnyObject
        ]
//        if let user_id = userId {
//            dict["user_id"] = user_id as AnyObject?
//        }
        print("dictionarryyyyy  ::::: %@",dict)
        let url = apis.baseURL + apis.getsAllJobs
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
//            result?(response, error, success)
            guard success == true else {
                result?(nil,error,false)
                return
            }
            if let dict = response as? [String : AnyObject] {
                let mapper = Mapper<Jobs>().map(JSONObject: dict)
//                let mapper = Mapper<Jobs>().map(_, response)
                result?(mapper,error,true)
//                if let resp = dict["response"] as? [String : AnyObject], let jobs = resp["jobs"] as? [AnyObject] {
////                    Utils.showAlert(withMessage: message)
//                    
//                }
            }else{
                result?(nil,error,false)
            }
        }
        
        
    }
    
    static func getAllApplicant(_ user_id : String ,jobId : String , result :  Completion?){
        
        
//        "user_id":100,"job_id":31
        
        let dict : Dictionary =
            [
                "user_id" : user_id as AnyObject,
                "job_id" : jobId as AnyObject
        ]
   
        print("dictionarryyyyy  ::::: %@",dict)
        let url = apis.baseURL + apis.getAllApplicant
        
        hitServerWith(true,urlString:url, parameters: dict as [String : AnyObject]?) { (response, error, success) -> () in
            print("sucessss     :::::::: \(success)")
            //            result?(response, error, success)
            guard success == true else {
                result?(nil,error,false)
                return
            }
            if let dict = response as? [String : AnyObject] {
                let mapper = Mapper<Applicant>().map(JSONObject: dict)
                //                let mapper = Mapper<Jobs>().map(_, response)
                result?(mapper ,error,true)
                
            }else{
                result?(nil,error,false)
            }
        }
        
        
    }
}
