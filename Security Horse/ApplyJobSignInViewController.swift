//
//  ApplyJobSignInViewController.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 02/05/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class ApplyJobSignInViewController: SignInViewController {

    @IBOutlet weak var txtPhoneNumber : UITextField?
    @IBOutlet weak var txtFullName : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction override func signUpTapped(_ sender : UIButton){
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
