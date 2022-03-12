//
//  MainHelper.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation
import UIKit

class MainHelper {
    
    static func instantiateVC(_ storyboard: UIStoryboard, _ id: String) -> UIViewController? {
             
        return storyboard.instantiateViewController(identifier: id)
    }

}
