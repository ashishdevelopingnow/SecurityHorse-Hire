//
//  ApplicantViewController.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 27/05/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class ApplicantViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var applicant : Applicant?
    
    @IBOutlet weak var applicantTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applicantTable.delegate = self
        applicantTable.dataSource = self
        applicantTable.rowHeight = UITableViewAutomaticDimension
        applicantTable.estimatedRowHeight = 44.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return applicant?.jobsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicantTableViewCell") as! ApplicantTableViewCell
        cell.selectionStyle = .none
        //        if let jobarry = jobsArray{
        cell .setData(applicant?.jobsArray?[indexPath.row])
        //        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
