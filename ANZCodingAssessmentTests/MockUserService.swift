//
//  MockUserService.swift
//  ANZCodingAssessmentTests
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import Foundation
@testable import ANZCodingAssessment

final class MockUserService: NetworkServiceProtocol {
    
    var shouldFail = false
    var isEmptyData = false
    var errorToThrow: URLError.Code?
    
    private let mockData = [User(id: 1, name: "Nola Rempel", company: "Kuhic and Sons", username: "Shea.Ryan", email: "Oral_Hirthe73@gmail.com", address: "56541 Jaskolski Lights", zip: "04651-6078", state: "West Virginia", country: "Cayman Islands", phone: "416.872.9431", photo: "https://json-server.dev/ai-profiles/16.png"),
                            User(id: 1, name: "John Doe", company: "Apple", username: "johnny",
                                 email: "john@apple.com", address: "1 Infinite Loop",
                                 zip: "95014", state: "CA", country: "USA",
                                 phone: "1234567890", photo: "https://json-server.dev/ai-profiles/1.png")
                            
    ]

    func fetchUsers() async throws -> [ANZCodingAssessment.User] {
        if shouldFail {
            switch errorToThrow {
            case .badURL:
                throw URLError(.badURL)
            case .badServerResponse:
                throw URLError(.badURL)
            default:
                throw URLError(.unknown)
            }
        } else if isEmptyData {
            return []
        }
        else {
            return mockData
        }
    }    
}
