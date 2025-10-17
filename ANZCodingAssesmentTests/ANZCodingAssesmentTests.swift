//
//  ANZCodingAssesmentTests.swift
//  ANZCodingAssesmentTests
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import XCTest
@testable import ANZCodingAssesment

@MainActor
final class ANZCodingAssesmentTests: XCTestCase {

    var mockService: MockUserService!
    var viewModel: UserListViewModel!

    override func setUp() {
        super.setUp()
        mockService = MockUserService()
        viewModel = UserListViewModel(service: mockService)
    }

    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }

    func testLoadUsersSuccess() async {
        await viewModel.loadUsers()

        XCTAssertFalse(viewModel.users.isEmpty)
        XCTAssertNil(viewModel.errorMsg)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testLoadUserBadUrl() async {
        mockService.shouldFail = true
        mockService.errorToThrow = .badURL
        await viewModel.loadUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertNotNil(viewModel.errorMsg)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testLoadUserBadResponse() async {
        mockService.shouldFail = true
        mockService.errorToThrow = .badServerResponse
        await viewModel.loadUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertNotNil(viewModel.errorMsg)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testLoadEmptyData() async {
        mockService.isEmptyData = true
        await viewModel.loadUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertNil(viewModel.errorMsg)
        XCTAssertFalse(viewModel.isLoading)
    }

}
