//
//  Interactor.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation
import Combine

protocol UseCase {
    
    func getPost() -> AnyPublisher<[PostModel], Error>
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error>
}

class Interactor: UseCase {
    
    private let repository: RepositoryProtocol
    
    required init(repository: RepositoryProtocol) {
       
        self.repository = repository
    }
    
    func getPost() -> AnyPublisher<[PostModel], Error> {
        return repository.getPost()
    }
    
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error> {
        return repository.getComment(postId: postId)
    }
}
