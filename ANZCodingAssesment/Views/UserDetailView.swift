//
//  UserDetailView.swift
//  ANZCodingAssesment
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        VStack {
            //Async Image view for lazy loading
            AsyncImage(url: URL(string: user.photo)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } placeholder: {
                Image(systemName: "person.crop.rectangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            
            VStack {
                Text(user.name)
                    .font(.title.bold())
                Text(user.company)
                    .font(.title2.bold())
                    .foregroundStyle(.secondary)
                Divider()
                Label(user.email, systemImage: "envelope")
                Label(user.phone, systemImage: "phone")
                Label("\(user.address), \(user.state)", systemImage: "map")
                Label(user.country, systemImage: "globe")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 2)
            )
        }
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    UserDetailView(user: User(id: 1, name: "Nola Rempel", company: "Kuhic and Sons", username: "Shea.Ryan", email: "Oral_Hirthe73@gmail.com", address: "56541 Jaskolski Lights", zip: "04651-6078", state: "West Virginia", country: "Cayman Islands", phone: "416.872.9431", photo: "https://json-server.dev/ai-profiles/16.png"))
}
