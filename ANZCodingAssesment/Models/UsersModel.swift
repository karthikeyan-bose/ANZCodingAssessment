//
//  UsersModel.swift
//  ANZCodingAssesment
//
//  Created by Karthikeyan Bose on 17/10/25.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let company: String
    let username: String
    let email: String
    let address: String
    let zip: String
    let state: String
    let country: String
    let phone: String
    let photo: String
}


/*
 {
   "id": 1,
   "name": "Nola Rempel",
   "company": "Kuhic and Sons",
   "username": "Shea.Ryan",
   "email": "Oral_Hirthe73@gmail.com",
   "address": "56541 Jaskolski Lights",
   "zip": "04651-6078",
   "state": "West Virginia",
   "country": "Cayman Islands",
   "phone": "416.872.9431",
   "photo": "https://json-server.dev/ai-profiles/16.png"
 },

 */
