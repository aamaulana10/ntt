//
//  AlertHelper.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

import SwiftMessages
import UIKit

class AlertHelper {
    
    static func successMsg(msg: String){
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(.success)
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        view.configureContent(title: "", body: msg)
        
        SwiftMessages.show(view: view)
    }
    
    static func infoMsg(msg: String){
        let view = MessageView.viewFromNib(layout: .messageView)
        var config = SwiftMessages.Config()
        config.presentationStyle = .bottom
        view.configureTheme(.info)
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        view.configureContent(body: msg)
        SwiftMessages.show(config: config, view: view)
    }
    
}
