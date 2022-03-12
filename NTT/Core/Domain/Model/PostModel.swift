//
//  PostModel.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

struct PostModel: Codable, Equatable {
    
    static func == (lhs: PostModel, rhs: PostModel) -> Bool {
        
        return lhs.id == rhs.id
    }
    
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var comment: [CommentModel]?
    
}
