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

/// The Model to hold our orders.
class OrderModel: ObservableObject{
    @Published var orderItems:[OrderItem] = []
    var customerName = "Customer Name"
    var orderStatus: OrderStatus = OrderStatus.pending
    var paymentStatus: PaymentStatus = PaymentStatus.paid
    var shippingAdress: ShippingAddress = ShippingAddress()
    
    ///Computes the count of order items
    var orderCount: Int{
        orderItems.count
    }

    ///Computes the grand total of the orders.
    var orderTotal: Int{
        var total: Int = 0
        for item in orderItems{
            total += item.extPrice
        }
        return total
    }
    
    private var lastID: Int = 0

    enum OrderStatus: String, Codable, CaseIterable {
        case pending = "Pending"
        case processing = "Processing"
        case shipped = "Shipped"
        case delivered = "Delivered"
        case empty = ""
    }
    
    enum PaymentStatus: String, Codable, CaseIterable {
        case paid = "Paid"
        case unpaid = "Unpaid"
        case empty = ""
    }
    
    func checkforItemInOrder(_ item: BookItem) -> Bool {
        for orderItem in orderItems {
            if orderItem.bookItem.id == item.id {
                return true
            }
        }
        return false
    }
    
    ///Adds an Order with a BookItem and quantity
    func addOrder(_ item:BookItem, quantity:Int){
        lastID += 1
        let newOrder = OrderItem(id: (lastID) , item:item, quantity:quantity)
        orderItems.append(newOrder)
    }
    
    /// Adds an Order from a OrderItem
    func addOrder(orderItem: OrderItem){
        lastID += 1
        var  newOrder = orderItem
        newOrder.id = lastID
        orderItems.append(newOrder)
    }
    
    /// Removes an Order by Id
    func removeOrderById(id: Int){
        if let index = orderItems.firstIndex(where: {$0.id == id}){
            orderItems.remove(at: index)
        }
    }
    
    /// Removes the last Order
    func removeLast(){
        orderItems.removeLast()
    }
}


struct ShippingAddress {
    let streetAdress: String = ""
    let city: String = ""
    let postalCode: String = ""
    let country: String = ""
    
}
