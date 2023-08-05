//
//  OrderDetailView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct OrderDetailView: View {
    @Binding var orderItem:OrderItem
    @Binding var presentSheet:Bool
    @Binding var newOrder:Bool
    
    
    @State private var quantity:Int
    @State private var name:String
    @State private var comments:String
    
    @EnvironmentObject var orders:OrderModel
    
    init(orderItem:Binding<OrderItem>,presentSheet:Binding<Bool>,newOrder:Binding<Bool>){
        self._orderItem = orderItem
        self._presentSheet = presentSheet
        self._newOrder = newOrder
        
        self.quantity = Int(orderItem.quantity.wrappedValue)
        self.name = orderItem.name.wrappedValue
        self.comments = orderItem.comments.wrappedValue
    }
    
    func updateOrder(){
        orderItem.quantity = quantity
        orderItem.name = name
        orderItem.comments = comments
    }
        
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 8){
                VStack {
                    if let image = UIImage(named: "book\(orderItem.bookItem.id)"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 220)
                    } else {
                        Image("bookError")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 220)
                    }
                }
                .padding(.top, 10)
                
                HStack {
                    Text(orderItem.bookItem.name)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("DarkGold"))
                        .lineLimit(2)
                    Spacer()
                }
                .padding([.top, .bottom], -4)

                VStack (spacing: 4) {
                    HStack {
                        Text("Author: \(orderItem.bookItem.author)")
                        Spacer()
                    }
                    HStack {
                        Text("Category: \(orderItem.bookItem.category.rawValue)")
                        Spacer()
                    }
                    HStack {
                        Text("Format: \(orderItem.bookItem.format.rawValue)")
                        Spacer()
                    }
                }
                .italic()
                .font(.system(size: 14, weight: .light))
                    

            
                HStack {
                    Stepper(value: $quantity, in: 1...10 ){
                        Text("\(quantity) " + (quantity == 1 ? "item" : "items"))
                    }
                    .italic()
                    .frame(width: geometry.size.width * 0.45)
                    .font(.system(size: 16))
                    
                    Spacer()
                    Text(orderItem.bookItem.price * quantity, format: .currency(code: "VND"))
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.orange)
                }
                
                Text("Order Name").font(.subheadline).foregroundColor(.secondary)
                TextField("Create order name for this book (optional)", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color("SealBrown") , radius: 1)

          
                Text("Comment").font(.subheadline).foregroundColor(.secondary)
                TextEditor(text:$comments)
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .shadow(color: Color("SealBrown") , radius: 1)

                HStack {
                    Button("Order"){
                        updateOrder()
                        if newOrder{
                            orders.addOrder(orderItem: orderItem)
                        } else {
                            orders.replaceOrder(id: orderItem.id, with: orderItem)
                        }
                        presentSheet = false
                    }
                    .padding([.top,.bottom], 8)
                    .padding([.leading,.trailing], 25)
                    .foregroundColor(.white)
                    .background(Color("DarkGold"),in: Capsule())
                    .font(.system(size: 20))
                    .shadow(color: Color("DarkGold"),radius:2,x:2,y:2)
                    .fontWeight(.semibold)
                    .padding(.trailing,40)
                    
                    Button("Cancel"){
                        presentSheet = false
                    }
                    .padding([.top,.bottom], 8)
                    .padding([.leading,.trailing], 20)
                    .foregroundColor(.white)
                    .background(Color("DarkGold"),in: Capsule())
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .shadow(color: Color("DarkGold"),radius:2,x:2,y:2)
                }
                .padding(.top, 4)
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .fontDesign(.serif)

        }
        
    }
    
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(orderItem:  .constant(testOrderItem), presentSheet: .constant(true), newOrder: .constant(false)).environmentObject(OrderModel())
    }
}

let noOrderItem = OrderItem(id: -1, item:noBookItem)

extension OrderModel{
    func replaceOrder(id:Int,with item:OrderItem){
        if let index = self.orderItems.firstIndex(where: {$0.id == id}){
            self.orderItems.remove(at: index)
            self.orderItems.insert(item, at: index)
        }
    }
    
}
