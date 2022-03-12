//
//  HomePresenter.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import Foundation
import Combine

class HomePresenter {
    
    private let useCase = Injection().provideUsecase()
    private var cancellables: Set<AnyCancellable> = []
    
    func getPost(offset: Int, completion: @escaping([PostModel]) -> ()) {
        
        useCase.getPost().sink { completion in
            
            switch completion {
            
            case .failure(let error):
                
                print("on error")
                print(error)
                 
            case .finished:
                
                print("on finish")
            }
            
        } receiveValue: { response in
            
            let postData = Array(response.prefix(offset))
            
            var postDataAfterComment = [PostModel]()
            
            for var data in postData {
                
                self.getCommentFromPost(postId: data.id, currentPost: postData) { dataComment in
                    
                    data.comment = dataComment
                    
                    postDataAfterComment.append(data)
                    
                    print(postDataAfterComment)
                    
                    completion(postDataAfterComment)
                }
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
        
        NavigationManager.instance.pushToVc(vc: vc)
    }
}
