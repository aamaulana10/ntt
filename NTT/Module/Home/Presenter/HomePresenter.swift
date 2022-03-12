//
//  HomePresenter.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import Foundation
import Combine
import UIKit

class HomePresenter {
    
    private let router = NavigationManager.instance
    private let useCase = Injection().provideUsecase()
    private var cancellables: Set<AnyCancellable> = []
    private let prefs = PreferenceManager.instance
    
    func getPost(vc: UIViewController, offset: Int, completion: @escaping([PostModel]) -> ()) {
        
        useCase.getPost().sink { completion in
            
            switch completion {
            
            case .failure(let error):
                
                print("on error")
                print(error)
                
            case .finished:
                
                print("on finish")
            }
            
        } receiveValue: { response in
            
            var dataPost = [PostModel]()
            
            if let userId = self.prefs.userData?.id {
                
                dataPost = response.filter { filterData in
                    
                    filterData.userId == userId
                }
                
            }
            
            if dataPost.count >= offset {
                
                let postData = Array(dataPost.prefix(offset))
                
                completion(postData)
            } else {
                
                completion(Array(dataPost.prefix(offset - dataPost.count)))
                return
            }
            
            
        }.store(in: &cancellables)
        
    }
    
    func getCommentFromPost(postId: Int, currentPost: [PostModel], completion: @escaping([CommentModel]) -> ()) {
        
        var postData = [PostModel]()
        
        useCase.getComment(postId: postId).sink { completion in
            
            switch completion {
            
            case .failure(let error):
                
                print("on error")
                print(error)
                
            case .finished:
                
                print("on finish")
            }
            
        } receiveValue: { response in
            
            
            let commentByPost = response.filter({ comment in
                
                comment.postId == postId
            })
            
            for var post in currentPost {
                
                if postId == post.id {
                    
                    post.comment = commentByPost
                }
                
                postData.append(post)
            }
            
            completion(commentByPost)
            
            
        }.store(in: &cancellables)
    }
    
    func gotoDetail(postData: PostModel) {
        
        let vc = DetailPostViewController()
        vc.dataPost = postData
        
        router.pushToVc(vc: vc)
    }
    
    func getUser(completion: @escaping(UserModel) -> ()) {
        
        if let user = prefs.userData {
            
            completion(user)
        }
    }
    
}
