//
//  Repository.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation
import Combine

protocol RepositoryProtocol {
    
    func getPost() -> AnyPublisher<[PostModel], Error>
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error>
    func getUserbyUsername(username: String) -> AnyPublisher<UserModel, Error>
}

final class Repository: NSObject {
    
    typealias RepositoryInstance = (RemoteDataSource)
        -> Repository
    fileprivate let remote: RemoteDataSource
    private init(remote: RemoteDataSource) {
        
        self.remote = remote
    }
    static let sharedInstance: RepositoryInstance = { remoteRepo in
        
        return Repository(remote: remoteRepo)
    }
    
}

extension Repository: RepositoryProtocol {
    
    func getPost() -> AnyPublisher<[PostModel], Error> {
        
        return remote.getPost()
    }
    
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error> {
        
        return remote.getComment(postId: postId)
    }
    
    func getUserbyUsername(username: String) -> AnyPublisher<UserModel, Error> {
        
        return remote.getUserbyUsername(username: username)
    }
    
}
