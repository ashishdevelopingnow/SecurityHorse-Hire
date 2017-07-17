//
//  ApplicantTableViewCell.swift
//  Security Horse
//
//  Created by Kuldeep Butola on 27/05/17.
//  Copyright © 2017 Kuldeep Butola. All rights reserved.
//

import UIKit

class ApplicantTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData (_ data : AppliedJobs?) {
        var nameV = ""
        if let name = data?.applicantDetails?.fname
        {
            nameV = name + " "
        }
        if let lname = data?.applicantDetails?.lname
        {
            nameV = nameV + lname
        }
        
        lblTitle.text = Utils.check( forEmpty: nameV) ? "Unidentified" : nameV
        lblSubTitle.text = data?.applicantDetails?.email
        lblDescription.text = data?.applicantDetails?.description
    }

}
