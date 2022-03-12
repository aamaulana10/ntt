//
//  PreferenceManager.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

class PreferenceManager {
    
    static let instance = PreferenceManager()
    private let userDefaults: UserDefaults = UserDefaults()
    
    private static let isLogin = "isLogin"
    private static let UserData = "user"
    
    var isLogin : Bool? {
        get {
            return userDefaults.bool(forKey: PreferenceManager.isLogin)
        }
        set(newLogin) {
            if let isLogin = newLogin{
                userDefaults.set(isLogin, forKey: PreferenceManager.isLogin)
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.isLogin)
            }
        }
    }
    
    var userData: UserModel? {
        get {
            
            if let data = UserDefaults.standard.data(forKey: PreferenceManager.UserData) {
                do {
                    
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(UserModel.self, from: data)
                    
                    return user
                    
                } catch {
                    print("Unable to Decode User (\(error))")
                }
            }
            
            return nil
            
        }
        set(newUser) {
            if let user = newUser {
                do {
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(user)
                    
                    userDefaults.set(data, forKey: PreferenceManager.UserData)
                } catch {
                    print("Unable to Encode User (\(error))")
                }
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.UserData)
            }
        }
    }
    
}
