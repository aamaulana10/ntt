//
//  Injection.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import Foundation

final class Injection: NSObject {
    
    private func initInjection() -> RepositoryProtocol {
        
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return Repository.sharedInstance(remote)
    }
    
    func provideUsecase() -> UseCase {
        
        let repository = initInjection()
        
        return Interactor(repository: repository)
    }

    
}
