//
//  OrderModel.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import Foundation


/// The Model to hold our orders.
class OrderModel: ObservableObject{
    @Published var orderItems:[OrderItem] = []
    var customerName = "Customer Name"
    private var lastID:Int = 0
    ///Use only for testing purposes
    init(){
        // Testing Code: comment out for production
//        orderItems.append(OrderItem(id:0,item: testMenuItem))
//        orderItems.append(OrderItem(id:1,item: MenuModel().menu[3],quantity: 2))
//        lastID = 1
        //testing code end
        
    }
    
    
    ///Computes the count of order items
    var orderCount:Int{
        orderItems.count
    }
    
    ///Computes the grand total of the orders.
    var orderTotal:Int{
        var total:Int = 0
        for item in orderItems{
            total += item.extPrice
        }
        return total
    }
    
//    ///Create order with a BookItem with quantity is 1
//    func createOrder(_ item:BookItem) -> OrderItem{
//        lastID += 1
//        return OrderItem(id: (lastID) , item:item, quantity: 1)
//    }

    ///Adds an Order with a BookItem and quantity
    func addOrder(_ item:BookItem, quantity:Int){
        lastID += 1
        let newOrder = OrderItem(id: (lastID) , item:item, quantity:quantity)
        orderItems.append(newOrder)
    }
    
    /// Adds an Order from a OrderItem
    func addOrder(orderItem:OrderItem){
        lastID += 1
        var  newOrder = orderItem
        newOrder.id = lastID
        orderItems.append(newOrder)
    }
    
    /// Removes an Order
    func removeOrder(id:Int){
        if let index = orderItems.firstIndex(where: {$0.id == id}){
            orderItems.remove(at: index)
        }
    }
    
    /// Removes the last Order
    func removeLast(){
        orderItems.removeLast()
    }
}
