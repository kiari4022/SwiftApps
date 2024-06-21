//
//  secondViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/29.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.likeButton.setImage(UIImage(systemName: "star"), for: .normal);
        self.likeButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        
        likeButton.tintColor = .gray


    }
    
    @IBAction func likeButton(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            sender.configuration?.baseForegroundColor = UIColor(red: 255/255, green: 200/255, blue: 119/255, alpha: 1.0)
            sender.configuration?.baseBackgroundColor = UIColor(red: 255/255, green: 225/255, blue: 225/255, alpha: 0.0)
    
           }
        else{
            sender.configuration?.baseForegroundColor = .gray
         }
     }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
