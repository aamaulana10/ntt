//
//  UIView+Ext.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation
import UIKit

extension UIView {
    
    func customRoundedView(radius: CGFloat, width: CGFloat, color: UIColor) {
        self.layer.borderColor          = color.cgColor
        self.layer.borderWidth          = width
        self.layer.cornerRadius         = radius
    }
}
