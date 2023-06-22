//
//  UserResponse.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//

import Foundation

struct Posts: Decodable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    
    static let mock = Posts(userId: 1, id: 1, title: "Mock", body: "This is a mock post")
}
