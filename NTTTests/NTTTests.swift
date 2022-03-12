//
//  NTTTests.swift
//  NTTTests
//
//  Created by aa maulana10 on 11/03/22.
//

import XCTest
import Combine
@testable import NTT

class NTTTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {}
    
    func testUserIsExist() throws {
        
        let username = "bret"
        
        let useCase = Injection.init().provideUsecase()
        useCase.getUserbyUsername(username: username)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { user in
                
                XCTAssert(
                    user.username.lowercased() == "bret"
                )
            })
            .store(in: &cancellables)
    }

}
