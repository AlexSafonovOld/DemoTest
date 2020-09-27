//
//  ViewController.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 24.09.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var enterLoginName: UITextField!
    @IBOutlet weak var search: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterLoginName.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKey))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        search.isEnabled = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        enterLoginName.text = ""
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goTo" else { return }
        guard let vCv = segue.destination as? TViewController else { return }
        if let name = enterLoginName.text {
            vCv.username = name
        } else { return }
    }
    
    
}







extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func hideKey() {
        self.view.endEditing(true)
    }
    
    
    @objc func textChanged(){
        if enterLoginName.text?.isEmpty == false {
            search.isEnabled = true
        } else {
            search.isEnabled = false
        }
    }
}


