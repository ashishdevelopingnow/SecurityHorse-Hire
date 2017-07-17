//
//  PrimaryCompanyViewController.swift
//  Security Horse
//
//  Created by Aureans Technocraft on 12/05/2017.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class PrimaryCompanyViewController: BaseViewController {

    @IBOutlet weak var fullNameName : UITextField!
    @IBOutlet weak var companyEmailAddress : UITextField!
    @IBOutlet weak var companyPhoneNumber : UITextField!
    
    @IBOutlet weak var bttnCheckBoxEmail : UIButton!
    @IBOutlet weak var bttnCheckBoxPhoneNumber : UIButton!
    
    var email : String?
    var phoneNumber : String?
    var companyName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fillBox = "    Fill in with "
        bttnCheckBoxEmail.setTitle(fillBox + (email ?? ""), for: .normal)
        bttnCheckBoxPhoneNumber.setTitle(fillBox + (phoneNumber ?? ""), for: .normal)
        
        bttnCheckBoxEmail.setTitle(fillBox + (email ?? ""), for: .selected)
        bttnCheckBoxPhoneNumber.setTitle(fillBox + (phoneNumber ?? ""), for: .selected)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkBoxEmailTapped (_ sender : UIButton){
        if sender.isSelected == true{
            sender.isSelected = false
            
            
        }else{
            sender.isSelected = true
            companyEmailAddress.text = email
        }
        
        
    }
    @IBAction func checkBoxPhoneNumberTapped (_ sender : UIButton){
        if sender.isSelected == true{
            sender.isSelected = false
            
            
        }else{
            sender.isSelected = true
            companyPhoneNumber.text = phoneNumber
        }
    }
    
    @IBAction func submitTapped(_ sender : UIButton){
        
        
        guard !Utils.check(forEmpty: fullNameName.text) else {
            UtilsSwift.showAlertWithMessage("Please enter full name", Constants.TITLE_ALERT)
            return
        }
        guard Utils.validateEmail(companyEmailAddress.text) else {
            UtilsSwift.showAlertWithMessage(Constants.VALID_EMAIL_ID, Constants.TITLE_ALERT)
            return
        }
        guard !Utils.check(forEmpty: companyPhoneNumber.text) else {
            UtilsSwift.showAlertWithMessage("Please enter phone number", Constants.TITLE_ALERT)
            return
        }
        self.view.endEditing(true)
        
        self.showHudWithMessage("")
        RequestSignUp.signInProcessSecond(email ?? "", company_phone: UtilsSwift.changeToPhoneNumberFormat(string: phoneNumber ?? ""), company_name: companyName ?? "", name: fullNameName.text ?? "", email: companyEmailAddress.text ?? "", mobileNo: UtilsSwift.changeToPhoneNumberFormat(string: companyPhoneNumber.text ?? "") ) { (obj, error, cmp) in
            self.hideHud()
            if cmp {
                self.performSegue(withIdentifier: "signIn", sender: self.companyEmailAddress.text)
            }
            
        }
    }
    
    @IBAction func postJobTapped(_ sender : UIButton){
        if let url = URL(string: "https://www.securityhorse.com/post-a-job"){
            UIApplication.shared.openURL(url)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
            
            if segue.identifier == "signIn"{
                let viewCont = segue.destination as? SignInMainViewController
                viewCont?.emailId = sender as? String
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
