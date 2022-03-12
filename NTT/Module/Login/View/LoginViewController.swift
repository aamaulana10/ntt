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
    @IBOutlet weak var btnLogin: UIButton!
    
    var presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.customRoundedView(radius: 5, width: 1, color: .link)

    }
    @IBAction func login(_ sender: UIButton) {
        
        let username = TFUsername.text!
        let password = TFPassword.text!
        
        presenter.login(userName: username, password: password)
    }
    
}
