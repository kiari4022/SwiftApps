//
//  confirmViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/15.
//

import UIKit

class confirmViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    
    
    
    var nameData = ""
    var mailData = ""
    var sexData = ""
    var birthData = ""
    var jobData = ""
    var passData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(nameData)"
        mailLabel.text = "\(mailData)"
        sexLabel.text = "\(sexData)"
        birthLabel.text = "\(birthData)"
        jobLabel.text = "\(jobData)"
        passLabel.text = "\(passData)"
        
        
    }
    

}
