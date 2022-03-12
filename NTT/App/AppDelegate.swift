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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let loginVc =  LoginViewController()
        
        mainNavigationController = UINavigationController(rootViewController: loginVc)
        mainNavigationController?.isNavigationBarHidden = true
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNavigationController
       
        return true
    }

}

