import UIKit

class singup2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var upperTextField: UITextField!
    
    var upperPickerView = UIPickerView()
    
    var upperData = ["", "男性", "女性"]
    
    @IBOutlet weak var lowerTextField: UITextField!
    
    var lowerPickerView = UIPickerView()
    
    var lowerData = ["", "社会人", "学生", "その他"]
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        createDatePicker()
        
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
        nameTextField.inputAccessoryView = toolbar
        mailTextField.inputAccessoryView = toolbar
        passTextField.inputAccessoryView = toolbar
        
        //キーボードタイプを番号のみに指定
        nameTextField.keyboardType = .default
        mailTextField.keyboardType = .emailAddress
        passTextField.keyboardType = .default
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let confirmView = segue.destination as! confirmViewController
            confirmView.nameData = nameTextField.text!
            confirmView.mailData = mailTextField.text!
            confirmView.sexData = upperTextField.text!
            confirmView.birthData = dateTextField.text!
            confirmView.jobData = lowerTextField.text!
            confirmView.passData = passTextField.text!
            
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if !passTextField.isFirstResponder {
            return
        }
    
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        passTextField.resignFirstResponder()
    }
    
    
    @objc func didTapDoneButton() {
        nameTextField.resignFirstResponder()
        mailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        
    }
    
    
    func createPickerView() {
        // upperPickerView
        upperPickerView.delegate = self
        upperTextField.inputView = upperPickerView
        // toolbar
        let upperToolbar = UIToolbar()
        upperToolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let upperDoneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(singup2ViewController.donePicker))
        upperToolbar.setItems([upperDoneButtonItem], animated: true)
        upperTextField.inputAccessoryView = upperToolbar
        
        // lowerPickerView
        lowerPickerView.delegate = self
        lowerTextField.inputView = lowerPickerView
        // toolbar
        let lowerToolbar = UIToolbar()
        lowerToolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let lowerDoneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(singup2ViewController.donePicker))
        lowerToolbar.setItems([lowerDoneButtonItem], animated: true)
        lowerTextField.inputAccessoryView = lowerToolbar
    }
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja-JP")
        
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolbar()
    }
    
    
    @objc func donePressed(){
        let dateFormattar = DateFormatter()
        dateFormattar.dateStyle = .medium
        dateFormattar.timeStyle = .none
        dateFormattar.dateFormat = "yyyy年MM月dd日"
        
        self.dateTextField.text = dateFormattar.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    
    @objc func donePicker() {
        upperTextField.endEditing(true)
        lowerTextField.endEditing(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        upperTextField.endEditing(true)
        lowerTextField.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == upperPickerView {
            return upperData.count
        } else {
            return lowerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == upperPickerView {
            return upperData[row]
        } else { //if pickerView == lowerPickerView
            return lowerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == upperPickerView {
            upperTextField.text = upperData[row]
            
        } else {
            lowerTextField.text = lowerData[row]
            
        }
    }
    
}


