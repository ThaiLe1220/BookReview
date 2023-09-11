//
//  FireBaseDB.swift
//  Book Lover
//
//  Created by Loc Phan Vinh on 11/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

let db = Firestore.firestore()

// MARK: - Add User
func addUser(user: User) {
    var userData = user.toDictionary()
    userData.removeValue(forKey: "id")
    
    db.collection("users").addDocument(data: userData) { error in
        if let error = error {
            print("Error adding user: \(error)")
        } else {
            print("User added successfully!")
        }
    }
}

// MARK: - Read
func fetchUserByUsername(username: String, completion: @escaping (User?) -> Void) {
    db.collection("users")
        .whereField("username", isEqualTo: username)
        .getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching user: \(error)")
                completion(nil)
            } else {
                if let document = querySnapshot?.documents.first,
                   let user = try? document.data(as: User.self) {
                    completion(user)
                } else {
                    completion(nil)
                }
            }
        }
}

// MARK: - Update
func updateUser(user: User) {
    if let userID = user.id {
        var userData = user.toDictionary()
        userData.removeValue(forKey: "id")
        db.collection("users").document(userID).setData(userData) { error in
            if let error = error {
                print("Error updating user: \(error)")
            } else {
                print("User updated successfully!")
            }
        }
    }
}

// MARK: - Delete
func deleteUser(userID: String) {
    db.collection("users").document(userID).delete { error in
        if let error = error {
            print("Error deleting user: \(error)")
        } else {
            print("User deleted successfully!")
        }
    }
}
