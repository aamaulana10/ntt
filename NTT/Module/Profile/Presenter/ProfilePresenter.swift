//
//  ProfilePresenter.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

class ProfilePresenter {
    
    private let prefs = PreferenceManager.instance
    
    func getUser(completion: @escaping(UserModel) -> ()) {
        
        if let user = prefs.userData {
            
            completion(user)
        }
    }
}
