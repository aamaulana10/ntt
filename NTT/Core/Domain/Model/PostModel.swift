//
//  PostModel.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

struct PostModel: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var comment: [CommentModel]?
    
}
