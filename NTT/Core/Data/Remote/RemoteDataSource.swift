//
//  RemoteDataSource.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
    
    func getPost() -> AnyPublisher<[PostModel], Error>
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error>
    func getUserbyUsername(username: String) -> AnyPublisher<UserModel, Error>
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getPost() -> AnyPublisher<[PostModel], Error> {
        
        return Future<[PostModel], Error> { completion in
            if let url = URL(string: API.getPost) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: [PostModel].self) { response in
                        
                        switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getComment(postId: Int) -> AnyPublisher<[CommentModel], Error> {
        
        return Future<[CommentModel], Error> { completion in
            if let url = URL(string: API.getComment(postId: postId)) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: [CommentModel].self) { response in
                        
                        switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getUserbyUsername(username: String) -> AnyPublisher<UserModel, Error> {
        
        return Future<UserModel, Error> { completion in
            if let url = URL(string: API.getUser) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: [UserModel].self) { response in
                        
                        switch response.result {
                        case .success(let value):
                            
                            let user = value.first { userModel in
                                
                                userModel.username.lowercased() == username.lowercased()
                            }
                            
                            if let user = user {
                                
                                completion(.success(user))
                                
                            } else {
                                
                                let error = NSError(domain: "Error", code: 403, userInfo: [NSLocalizedDescriptionKey: "User not found"])
                                
                                completion(.failure(error))
                            }
                            
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
