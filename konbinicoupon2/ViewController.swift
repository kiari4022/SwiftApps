//
//  ViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logmailTextField: UITextField!
    
    @IBOutlet weak var logPassTextFIeld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        //完了ボタンを作成
        let done = UIBarButtonItem(title: "Done",
                                   style: .done,
                                   target: self,
                                   action: #selector(didTapDoneButton))
        
        //toolbarのitemsに作成したスペースと完了ボタンを入れる。
        toolbar.items = [done]
        toolbar.sizeToFit()
        
        //作成したtoolbarをtextFieldのinputAccessoryViewに入れる
        logmailTextField.inputAccessoryView = toolbar
        logPassTextFIeld.inputAccessoryView = toolbar

        
        //キーボードタイプを番号のみに指定
        logmailTextField.keyboardType = .default
        logPassTextFIeld.keyboardType = .emailAddress

        // Do any additional setup after loading the view.
    }
    
    
    @objc func didTapDoneButton() {
        logmailTextField.resignFirstResponder()
        logPassTextFIeld.resignFirstResponder()
       
        
    }


}

