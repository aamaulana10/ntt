//
//  AppDelegate.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    var mainNavigationController: UINavigationController?
    let prefs = PreferenceManager.instance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if prefs.isLogin == true {
            
            let mainTabbarVc =  MainTabbarController()
            
            mainNavigationController = UINavigationController(rootViewController: mainTabbarVc)
            mainNavigationController?.isNavigationBarHidden = true
            
        } else {
            
            let loginVc =  LoginViewController()
            
            mainNavigationController = UINavigationController(rootViewController: loginVc)
            mainNavigationController?.isNavigationBarHidden = true
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNavigationController
       
        return true
    }

}

