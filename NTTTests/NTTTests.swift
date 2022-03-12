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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
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
