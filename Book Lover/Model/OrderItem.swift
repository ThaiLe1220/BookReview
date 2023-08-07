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
