//
//  OrderItem.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import Foundation


struct OrderItem: Identifiable, Hashable {
    var id: Int
    var item:BookItem
    
    var quantity: Int
    var name: String = ""
    var preferredFormat:BookFormat
    var comments: String = ""
    
    init(id:Int, item:BookItem, quantity:Int = 1) {
        self.id = id
        self.item = item
        self.quantity = quantity
        self.preferredFormat = item.format
    }
    
    init(id: Int, item: BookItem, quantity: Int, name: String, preferredCrust: BookFormat, comments: String) {
        self.id = id
        self.item = item
        self.quantity = quantity
        self.name = name
        self.preferredFormat = preferredCrust
        self.comments = comments
    }
    
    var extPrice:Int {
        item.price * quantity
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
    
//    static func == (lhs:OrderItem, rhs:OrderItem) -> Bool {
//        lhs.id = rhs.id &&
//        lhs.item = rhs.item &&
//        lhs.quantity = rhs.quantity &&
//        lhs.extraIngredients = rhs.extraIngredients &&
//        lhs.name = rhs.name &&
//        lhs.preferredCrust = rhs.preferredCrust &&
//        lhs.comments = rhs.comments &&
//
//    }

}

let testOrderItem = OrderItem(id: 1, item: testBookItem)

let testOrders = [testOrderItem, OrderItem (id: 2, item: BookModel().book[0], quantity: 2)]
