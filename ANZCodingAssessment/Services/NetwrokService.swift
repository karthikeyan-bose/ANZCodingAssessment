//
//  NetwrokService.swift
//  ANZCodingAssessment
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchUsers() async throws -> [User]
}

final class NetwrokService: NetworkServiceProtocol {
    
    //Fetch user from API
    func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://fake-json-api.mock.beeceptor.com/users")
        
        guard let userFetchUrl = url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: userFetchUrl)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
