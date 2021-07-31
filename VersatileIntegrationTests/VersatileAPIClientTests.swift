//
//  VersatileAPIClientTests.swift
//  VersatileIntegrationTests
//
//  Created by uhooi on 2021/07/25.
//

import XCTest
@testable import Versatile

final class VersatileAPIClientTests: XCTestCase {
    
    // MARK: Stored Instance Properties
    
    private let versatileAPIClient = VersatileAPIClient.shared
    
    // MARK: TestCase Life-Cycle Methods
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Test Methods
    
    // MARK: VersatileRepository
    
    // MARK: User
    
    func test_user() {
        let expectation = expectation(description: "User")
        XCTContext.runActivity(named: "Register") { _ in
            let uhooiName = "uhooi"
            let uhooiDescription = "green monster."
            versatileAPIClient.registerUser(name: uhooiName, description: uhooiDescription) { registerUserResult in
                switch registerUserResult {
                case let .success(registeredUserID):
                    XCTContext.runActivity(named: "Fetch") { _ in
                        self.versatileAPIClient.fetchUser(userID: registeredUserID.id) { fetchUserResult in
                            switch fetchUserResult {
                            case let .success(fetchedUser):
                                XCTAssertEqual(fetchedUser.id, registeredUserID.id)
                                XCTAssertEqual(fetchedUser.name, uhooiName)
                                XCTAssertEqual(fetchedUser.description, uhooiDescription)
                                XCTContext.runActivity(named: "Update") { _ in
                                    let updatedUhooiDescription = "yellow monster."
                                    self.versatileAPIClient.updateUser(name: uhooiName, description: updatedUhooiDescription) { updateUserResult in
                                        switch updateUserResult {
                                        case let .success(updatedUserID):
                                            XCTAssertEqual(updatedUserID, registeredUserID)
                                            XCTContext.runActivity(named: "Refetch") { _ in
                                                self.versatileAPIClient.fetchUser(userID: updatedUserID.id) { refetchUserResult in
                                                    switch refetchUserResult {
                                                    case let .success(refetchedUser):
                                                        XCTAssertEqual(refetchedUser.id, updatedUserID.id)
                                                        XCTAssertEqual(refetchedUser.name, uhooiName)
                                                        XCTAssertEqual(refetchedUser.description, updatedUhooiDescription)
                                                        expectation.fulfill()
                                                    case let .failure(error):
                                                        XCTFail("Error: \(error)")
                                                        expectation.fulfill()
                                                    }
                                                }
                                            }
                                        case let .failure(error):
                                            XCTFail("Error: \(error)")
                                            expectation.fulfill()
                                        }
                                    }
                                }
                            case let .failure(error):
                                XCTFail("Error: \(error)")
                                expectation.fulfill()
                            }
                        }
                    }
                case let .failure(error):
                    XCTFail("Error: \(error)")
                    expectation.fulfill()
                }
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_fetchAlluser() {
        // TODO:
    }
    
    // MARK: Tweet
    
}
