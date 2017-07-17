//
//  ViewController.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 23/12/16.
//  Copyright © 2016 Kuldeep Butola. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

//    var emailId : String?
    @IBOutlet weak var launchView : UIView?

     @IBOutlet weak var companyName : UITextField!
     @IBOutlet weak var companyEmailAddress : UITextField!
     @IBOutlet weak var companyPhoneNumber : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchView?.isHidden = true
//        textFeild1?.text = emailId
        
//        self.view.layoutIfNeeded()
        
        
//        UtilsSwift.addBorderTextFeild(textFeild1!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefault.getUserInfo() != nil && launchView != nil{
            launchView?.isHidden = false
            performSegue(withIdentifier: "showJobs", sender: nil)
        }else{
            launchView?.isHidden = true
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOutTapped(_ segue : UIStoryboardSegue){
        
    }

    
    //MARK: IBAction
    
    @IBAction func signUpTapped(_ sender : UIButton){
        
        guard !Utils.check(forEmpty: companyName.text) else {
            UtilsSwift.showAlertWithMessage("Please enter company name", Constants.TITLE_ALERT)
            return
        }
        guard Utils.validateEmail(companyEmailAddress.text) else {
            UtilsSwift.showAlertWithMessage(Constants.VALID_EMAIL_ID, Constants.TITLE_ALERT)
            return
        }
        guard !Utils.check(forEmpty: companyPhoneNumber.text) else {
            UtilsSwift.showAlertWithMessage("Please enter company phone number", Constants.TITLE_ALERT)
            return
        }
        self.view.endEditing(true)
        
        let phoneNo = UtilsSwift.changeToPhoneNumberFormat(string: companyPhoneNumber.text ?? "")
        self.showHudWithMessage("")
        RequestSignUp.signInProcessFirst(companyEmailAddress.text ?? "", company_phone: phoneNo, company_name: companyName.text ?? "") { (obj, errr, comp) in
            self.hideHud()
            if comp {
                self.performSegue(withIdentifier: "verify", sender: nil)
            }
        }
        

        
    }
    
//    @IBAction func signInTapped(_ sender : UIButton){
//        self.performSegue(withIdentifier: "verify", sender: nil)
//        
//        
//    }

    
    
    @IBAction func postJobTapped(_ sender : UIButton){
        if let url = URL(string: "https://www.securityhorse.com/post-a-job"){
            UIApplication.shared.openURL(url)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "verify"{
            let viewCont = segue.destination as? PrimaryCompanyViewController
            viewCont?.email = companyEmailAddress.text
            viewCont?.phoneNumber = companyPhoneNumber.text
            viewCont?.companyName = companyName.text
        }else
        
        if segue.identifier == "signIn"{
            let viewCont = segue.destination as? SignInMainViewController
            viewCont?.emailId = sender as? String
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

