//
//  WishlistItem.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 04/08/2023.
//

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
