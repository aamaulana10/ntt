//
//  CommentModel.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

struct CommentModel: Codable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
