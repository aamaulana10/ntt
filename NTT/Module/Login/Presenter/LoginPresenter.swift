//
//  LoginPresenter.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import Foundation

class LoginPresenter {
    
    private let router = NavigationManager.instance
    
    func login() {
        
        print("tes")
        
        let vc =  MainTabbarController()
        
        router.pushToVc(vc: vc)
    }
}
