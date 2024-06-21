//
//  searchViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/16.
//

import UIKit

class searchViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet weak var searchNavigationBar: UINavigationBar!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchNavigationBar.delegate = self
        
        // ツールバー生成 サイズはsizeToFitメソッドで自動で調整される。
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        //サイズの自動調整。敢えて手動で実装したい場合はCGRectに記述してsizeToFitは呼び出さない。
        toolBar.sizeToFit()

        // 左側のBarButtonItemはflexibleSpace。これがないと右に寄らない。
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // Doneボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))

        // BarButtonItemの配置
        toolBar.items = [spacer, commitButton]
        // textViewのキーボードにツールバーを設定
        searchBar.inputAccessoryView = toolBar
        
        searchBar.backgroundImage = UIImage()

        // Do any additional setup after loading the view.
    }
    
    @objc func commitButtonTapped(){
        self.view.endEditing(true)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
            return .topAttached
        }



}
