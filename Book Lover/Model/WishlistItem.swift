/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Le Hong Thai
  ID: s3752577
  Created  date: 31/7/2023
  Last modified: 7/8/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation

struct WishlistItem: Codable,Hashable,Identifiable, Equatable {
    var id: Int
    var bookItem: BookItem
//    var date: Date
    
    init(id:Int, bookItem:BookItem) {
        self.id = bookItem.id
        self.bookItem = bookItem
    }
    
}

let testWishlistItem = WishlistItem(id: -1, bookItem: testBookItem)

let testWishlists = [testWishlistItem, WishlistItem(id: 2, bookItem: BookModel().book[0])]
