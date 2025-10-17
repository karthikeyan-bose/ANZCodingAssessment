//
//  ContentView.swift
//  ANZCodingAssesment
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import SwiftUI

// MARK: - View
// Displays list of users and handles navigation

struct ContentView: View {
    
    @StateObject private var viewModel = UserListViewModel()
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading users...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .font(.headline)
            }
            else if viewModel.users.isEmpty {
                ContentUnavailableView("No users found",
                                        systemImage: "person.crop.circle.badge.exclamationmark")
            } else {
                List(viewModel.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserCell(user: user)
                    }
                }
                .navigationTitle("Users")
                
            }
            
        }
        .task {
            await viewModel.loadUsers()
        }
    }
    
}

// MARK: - View
// User Cell View for List

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            //Async Image view for lazy loading
            AsyncImage(url: URL(string: user.photo)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.company)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ContentView()
}
