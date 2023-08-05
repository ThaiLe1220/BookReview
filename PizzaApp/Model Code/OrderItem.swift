//
//  OrderItem.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import Foundation


struct OrderItem: Identifiable, Hashable {
    var id: Int
    var bookItem: BookItem
    var quantity: Int
    var name: String = ""
    var comments: String = ""
    
    init(id:Int, item:BookItem, quantity:Int = 1) {
        self.id = id
        self.bookItem = item
        self.quantity = quantity
    }
    
    init(id: Int, item: BookItem, quantity: Int, name: String, preferredCrust: BookFormat, comments: String) {
        self.id = id
        self.bookItem = item
        self.quantity = quantity
        self.name = name
        self.comments = comments
    }
    
    var extPrice:Int {
        bookItem.price * quantity
    }

}

let testOrderItem = OrderItem(id: 1, item: testBookItem)

let testOrders = [testOrderItem, OrderItem (id: 2, item: BookModel().book[0], quantity: 2)]
