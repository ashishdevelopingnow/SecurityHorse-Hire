//
//  MyJobsViewController.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 13/02/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class MyJobsViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var jobsArray = [JobsArray]()
    @IBOutlet weak var jobTableView : UITableView!
    
    deinit {
        removeNotification()
    }
    
    func removeNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        jobTableView.isHidden = true
        jobTableView.delegate = self
        jobTableView.dataSource = self
        jobTableView.rowHeight = UITableViewAutomaticDimension
        jobTableView.estimatedRowHeight = 44.0
        
        self.addRefreshViewInTable(jobTableView)
        setUI()
       requestForRefreshView(completion: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func refreshTable(_ sender: UIRefreshControl) {
        requestForRefreshView { () -> Void in
            sender.endRefreshing()
        }
    }
    
    func requestForRefreshView(completion : (()-> Void)?) -> Void {
    
        guard let userID = UserDefault.getUserId() else{
            completion?()
            return
        }
            
            RequestJobs.getssJobList(0 , userId : userID, result: { (obj, err, done) in
                if let aa = obj as? Jobs , let objjj = aa.jobsArray {
                    self.jobsArray.removeAll()
                    self.jobsArray.append(contentsOf: objjj)
                    self.jobTableView.reloadData()
                    self.setUI()
                }
                completion?()
                
            })
//            RequestClass.getssJobList(userID,nil,nil) { (obj, err, done) in
//                
//            }
            
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUI() {
        
        
        jobTableView.isHidden = jobsArray.count == 0
    }
    
    // MARK: - IBAction
    @IBAction func applyForJobTapped(_ sender : UIButton) {
        self.tabBarController?.selectedIndex = 0
    }
    //MARK: - UITableView delegate datasourse
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return jobsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell") as! JobTableViewCell
        cell.selectionStyle = .none
//        if let jobarry = jobsArray{
            cell .setdata(jobs: jobsArray[indexPath.row])
//        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = jobsArray[indexPath.row]
        if let jobId = obj.jobDetails?.job_Id , let userId = UserDefault.getUserId(){
            self.showHudWithMessage("")
            RequestJobs.getAllApplicant(userId, jobId: jobId , result: { (obj, err, done) in
                self.hideHud()
                if done , let object = obj as? Applicant {
                    self.performSegue(withIdentifier: "showApplicant", sender: object)
                }
                
            })
            
        }
        
        
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showApplicant"  {
            let viewCnt = segue.destination as? ApplicantViewController
            viewCnt?.applicant = sender as? Applicant
            
        }else
        
        if segue.identifier == "jobDetails" {
            let viewCnt = segue.destination as? JobDetailsViewController
            viewCnt?.jobsArray = sender as? JobsArray
            viewCnt?.refreshView = {() in
                self.jobTableView.reloadData()
            }
            
        }
    }

}
