//
//  ProfileViewController.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var presenter = ProfilePresenter()
    
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserAddress: UILabel!
    @IBOutlet weak var lblUserPhone: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    func setupData() {
        
        presenter.getUser { user in
            
            self.lblUserName.text = user.username
            self.lblUserEmail.text = user.email
            self.lblUserPhone.text = user.phone
            self.lblUserAddress.text = "\(user.address.street), \(user.address.city)"
        }
    }

}
