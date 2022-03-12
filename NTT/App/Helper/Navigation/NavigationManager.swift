//
//  NavigationManager.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import Foundation
import UIKit

class NavigationManager {
    
    static let instance = NavigationManager()
    
    var mainNavigationController:UINavigationController?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let prefs = PreferenceManager.instance
    
    func pushToVc(vc: UIViewController) {
        
        self.appDelegate.mainNavigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToNewRoot(vc: UIViewController) {
        
        self.mainNavigationController = UINavigationController(rootViewController: vc)
        self.appDelegate.window?.rootViewController = self.mainNavigationController
    }
}
