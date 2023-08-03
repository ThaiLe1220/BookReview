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
    @State private var bookFormat:BookFormat
    @State private var name:String
    @State private var comments:String
    
    @EnvironmentObject var orders:OrderModel
    
    init(orderItem:Binding<OrderItem>,presentSheet:Binding<Bool>,newOrder:Binding<Bool>){
        self._orderItem = orderItem
        self._presentSheet = presentSheet
        self._newOrder = newOrder
        
        self.quantity = Int(orderItem.quantity.wrappedValue)
        self.bookFormat = orderItem.preferredFormat.wrappedValue
        self.name = orderItem.name.wrappedValue
        self.comments = orderItem.comments.wrappedValue

    }
    
    
    func updateOrder(){
        orderItem.quantity = quantity
        orderItem.name = name
//        orderItem.price = price
        orderItem.preferredFormat = bookFormat
        orderItem.comments = comments
    }
        
    var body: some View {
        VStack{
            HStack (alignment: .top) {
                if let image = UIImage(named: "duneBook\(orderItem.item.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],5)
                        .cornerRadius(15)
                        
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                        
                }
                Text(orderItem.item.name)
                    .font(.title2)
                    .fontWeight(.semibold)
//                    .foregroundColor()
                    .padding(.trailing)
                Spacer()

            }
//            .background(.linearGradient(colors: [Color("DarkGold"),Color("CrayolaGold"), Color("Sky")], startPoint: .leading, endPoint: .trailing), in:Capsule())
//            .padding(.leading, -20)
            
//
//            TextField("Mark this book for", text: $name)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
////                .padding()
            
            VStack{
                Picker(selection: $bookFormat) {
                    ForEach(BookFormat.allCases ,id:\.self){format in
                        format.rawValue != "" ? Text(format.rawValue).tag(format) : nil
                    }
                } label: {
                    Text("Book Format" + bookFormat.rawValue)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
//                .foregroundColor(.black)
//                .background(.regularMaterial)

                
                Stepper(value: $quantity, in: 1...10 ){
                    Text("\(quantity) " + (quantity == 1 ? "item" : "items"))
                        .padding(.leading, 8)
                }
            }
            .background(.thinMaterial)
            .cornerRadius(3)
            
                Text("Comments").font(.caption).foregroundColor(.secondary)
                TextEditor(text:$comments)
                    .frame(maxHeight:200)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .shadow(radius: 1)
            Spacer()
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
                    .background(Color("SealBrown"),in: Capsule())
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
                .background(Color("SealBrown"),in: Capsule())
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .shadow(color: Color("DarkGold"),radius:2,x:2,y:2)
            }
        }
        .padding(8)
        .background(.ultraThinMaterial)
        .navigationTitle("Your Order")
        
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
