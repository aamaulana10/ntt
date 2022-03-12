//
//  MainTabbarController.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import UIKit

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
           super.viewDidLoad()
        
           self.delegate = self
           
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           let tabOne = HomeViewController()
           let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
           
           tabOne.tabBarItem = tabOneBarItem
           
           let tabTwo = ProfileViewController()
           let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
           
           tabTwo.tabBarItem = tabTwoBarItem2
        
        print("called")
           
           
           self.viewControllers = [tabOne, tabTwo]
       }
       
       // UITabBarControllerDelegate method
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           print("Selected \(viewController)")
       }
}
