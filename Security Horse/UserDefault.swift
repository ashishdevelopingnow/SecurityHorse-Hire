//
//  UserDefault.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 17/01/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class UserDefault: NSObject {

    struct NOTIFICATION {
        static let Applied_Job = "userappliedForTheJob"
//        static let USER_EMAIL = "userDefaultEmailId"
    }
    struct USER_DEFAULT {
        static let USER_INFO = "userDefaultUsersInformationHire"//Using
        
//        static let USER_EMAIL = "userDefaultEmailId"
//        static let CONNECTED_TO_FACEBOOK = "connectedToFaceBook"
//        static let FACEBOOK_DATA = "facebookdata"
//        
//        static let LICENCE_IMAGE = "licenceImage"
//        
//        static let VERIFIED_MOBILE_NO = "userdefaultVarifiedMobileNo"
//        static let IS_VERIFIED_MOBILE_NO = "userdefaultismobilenumberVerified"
    }
    //MARK: - SignOu
    static func signOut(){
        saveUserInfo(nil)
//        connectedToFB(false)
//        saveFbData(nil)
//        saveLicenceImage(nil)
//        
//        saveVerifiedMobileNumber(nil)
//        saveMobileNumberVerified(false)
    }
    
    //MARK: - User details
    static func saveUserInfo(_ data : [String : AnyObject]?) {

        
        Utils.saveData(toUserDefault: data, key: USER_DEFAULT.USER_INFO)
    }
    static func getUserInfo() -> Any? {
        return Utils.dataFromUserDefault(forKey: USER_DEFAULT.USER_INFO)
    }
    static func getUserId() -> String? {
        let data = Utils.dataFromUserDefault(forKey: USER_DEFAULT.USER_INFO) as? [String : AnyObject]
        let abc = data?["User"]?["id"] as? String
        return abc
    }
    
    
    
    
}
