//
//  UserListViewModel.swift
//  ANZCodingAssessment
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import Foundation

@MainActor

final class UserListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var errorMsg: String?
    @Published var isLoading = false
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol = NetwrokService()) {
        self.service = service
    }
    
    func loadUsers() async {
        isLoading = true
        do {
            users = try await service.fetchUsers()
        } catch  {
            errorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
