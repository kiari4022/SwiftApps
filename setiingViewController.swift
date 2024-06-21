//
//  setiingViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/16.
//

import UIKit

class setiingViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var setiingNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setiingNavigationBar.delegate = self
    }
    
    func  position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    


}
