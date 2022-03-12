//
//  LoginPresenter.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import Foundation
import Combine

class LoginPresenter {
    
    private let router = NavigationManager.instance
    private let useCase = Injection().provideUsecase()
    private var cancellables: Set<AnyCancellable> = []
    private let prefs = PreferenceManager.instance
    
    func login(userName: String, password: String) {
        
        if userName == "" || password == "" {
            
            AlertHelper.infoMsg(msg: "Please fill data correctly")
            
            return
        }
        
        useCase.getUserbyUsername(username: userName)
            .sink { completion in
                
                switch completion {
                
                case .failure(let error):
                    
                    print("on error")
                    print(error)
                    AlertHelper.infoMsg(msg: error.localizedDescription)
                
                case .finished:
                    
                    print("on finish")
                }
                
            } receiveValue: { user in
                
                AlertHelper.successMsg(msg: "Welcome \(user.username)")
                
                self.prefs.userData = user
                
                let vc =  MainTabbarController()
                
                self.router.pushToVc(vc: vc)
                
                
            }.store(in: &cancellables)

    }
    
}
