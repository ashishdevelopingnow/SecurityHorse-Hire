//
//  Applicant.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 27/05/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit
import ObjectMapper

class Applicant: Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {
        
    }
    
    var message : String?
    var offset : Int32?
    var jobsArray : [AppliedJobs]?
    
    func mapping(map: Map) {
        message <- map["status"]
        offset <- map["offset"]
        jobsArray <- map["data"]
    }
}
class AppliedJobs : Mappable{
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {
        
    }
    
    var jobAppliedDetails : JobAppliedDescription?
    var applicantDetails : ApplicantDetails?
    var userApplyJob : UserApplyJob?
    
    func mapping(map: Map) {
        jobAppliedDetails <- map["Job"]
        applicantDetails <- map["User"]
        userApplyJob <- map["UserApplyJob"]
    }
}

class JobAppliedDescription : Mappable{
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {
        
    }
    
    var company_id : String?
    var created_date_time : String?
    var job_description : String?
    var id : String?// = 0
    var job_title : String?//= 0
    var updated_date_time : String?
    
    var slug : String?
    var status : String?
    
    
    func mapping(map: Map) {
        slug <- map["slug"]
        updated_date_time <- map["updated_date_time"]
        status <- map["status"]
        
        company_id <- map["company_id"]
        created_date_time <- map["created_date_time"]
        id <- map["id"]
        
        
        job_description <- map["job_description"]
        job_title <- map["job_title"]
        
    }
    
}


class ApplicantDetails : Mappable{
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {
        
    }
    
    var account_type_id : String?
    var created_date_time : String?
    var id : Int32 = 0
    var updated_date_time : String?
    var ejabberd_password : String?
    
    var description : String?
    var ejabberd_user : String?
    var email : String?
    var facebook_profile : String?
    
    
    var fname : String?
    var forgot_expire : String?
    var lname : String?
    var mobile_number : String?
    var security_license : String?
    
    
    var profile_img : String?
    var stripe_customer : String?
    var security_license_photo : String?
    
    var username : String?
    
    
    func mapping(map: Map) {
        account_type_id <- map["account_type_id"]
        
        created_date_time <- map["created_date_time"]
        updated_date_time <- map["updated_date_time"]
        id <- map["id"]
        
        
        description <- map["description"]
        
        ejabberd_password <- map["ejabberd_password"]
        ejabberd_user <- map["ejabberd_user"]
        email <- map["email"]
        
        facebook_profile <- map["facebook_profile"]
        
        fname <- map["fname"]
        forgot_expire <- map["forgot_expire"]
        lname <- map["lname"]
        
        mobile_number <- map["mobile_number"]
        
        profile_img <- map["profile_img"]
        security_license <- map["security_license"]
        security_license_photo <- map["security_license_photo"]
        
        stripe_customer <- map["stripe_customer"]
        username <- map["username"]
        
        
    }
    
}
class UserApplyJob : Mappable{
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    
    var accepted : String?
    var job_type , hourly_rate , location_name: String?
    var location_state : String?
    
    //    var id : Int32 = 0
    //    var updated_date_time : String?
    //    var companyImage : String?
    public required init?(map: Map) {
        //        max_hourly_rate = 0
        //        min_hourly_rate = 0
    }
    
    func mapping(map: Map) {
        
        accepted  <- map["accepted"]
        
        job_type <- map["id"]
        
        hourly_rate <- map["job_id"]
        
        location_name <- map["not_interested"]
        location_state <- map["user_id"]
        
        //        let abc = map["max_hourly_rate"] as AnyObject?
        //        let abcd = map["min_hourly_rate"] as AnyObject?
        
        
//        accepted = 1;
//        "created_date_time" = "2017-05-17 10:41:11";
//        id = 154;
//        "job_id" = 31;
//        "not_interested" = 0;
//        "updated_date_time" = "0000-00-00 00:00:00";
//        "user_id" = 72;
        
    }
}
