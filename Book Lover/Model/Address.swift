//
//  Address.swift
//  Book Lover
//
//  Created by Loc Phan Vinh on 11/09/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Address: Codable {
    var street: String
    var city: String
    var country: String
}
