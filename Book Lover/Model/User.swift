//
//  User.swift
//  Book Lover
//
//  Created by Loc Phan Vinh on 11/09/2023.
//

import Foundation

struct User: Codable {
    var id: String?
    var username: String
    var password: String
    
    // Add other properties as needed
    // var email: String? // TODO: check xem co phai email;
    // TODO: Add them struct Address(Country, City, Street)
//    var address: Address
    
    // Initialize from Firestore data
    init(from dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.username = dictionary["username"] as? String ?? ""
        self.password = dictionary["password"] as? String ?? ""
    }

    // Convert to Firestore data
    func toDictionary() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary["id"] = id
        dictionary["username"] = username
        dictionary["password"] = password
        return dictionary
    }
}
