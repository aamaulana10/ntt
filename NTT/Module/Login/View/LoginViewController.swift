//
//  LoginViewController.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var TFUsername: UITextField!
    @IBOutlet weak var TFPassword: UITextField!
    
    var presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func login(_ sender: UIButton) {
        
        let username = TFUsername.text!
        let password = TFPassword.text!
        
        presenter.login(userName: username, password: password)
    }
    
}
