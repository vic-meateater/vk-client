//
//  ViewController.swift
//  vk-client
//
//  Created by Vic on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLable: UILabel!
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkUserCred = checkUser(login: loginTextField.text ?? "", passwod: passwordTextField.text ?? "")
        if !checkUserCred{
            errorLable.isHidden = false
            return false
        }
            return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tapToHide = UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard))
        scrollView.addGestureRecognizer(tapToHide)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {

    }
    
    @objc func tapToHideKeyboard(){
        self.view.endEditing(true)
    }
    
    func checkUser(login: String, passwod pass: String) -> Bool {
        let userLogin = "Vic"
        let userPassword = "123"
        return login == userLogin && pass == userPassword
    }

}

