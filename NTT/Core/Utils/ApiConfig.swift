//
//  ApiConfig.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

class API {
    
    static let baseUrl  = "https://jsonplaceholder.typicode.com/"
    
    static let getPost  = "\(API.baseUrl)posts"
    static let getUser  = "\(API.baseUrl)users"
    static func getComment(postId: Int) -> String {
        return "\(API.baseUrl)posts/\(postId)/comments"
    }
}
