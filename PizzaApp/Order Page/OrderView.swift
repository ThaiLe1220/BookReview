//
//  OrderView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders :OrderModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Your Order")
                Spacer()
            }
            .font(.system(size: 25))
            .foregroundColor(Color("SealBrown"))
            .fontWeight(.semibold)
            .frame(height: 20)
            .padding(10)
            .border(.blue)
            
            
            NavigationStack {
                List($orders.orderItems){ $order in
                    
                    NavigationLink(value: order){
                        OrderRowView(order: $order)
                            .padding(4)
                            .background(.regularMaterial, in:RoundedRectangle(cornerRadius: 4))
                            .shadow(radius: 5)
                            .padding(.bottom, 5)
                            .padding([.leading,.trailing], 8)
                    }.navigationDestination(for: OrderItem.self) { order in
                        OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                    }
                    .navigationTitle("Your Order")
                    
                }
            }
            .padding(.top, 20)
            .background(.ultraThinMaterial)
            
            
            HStack {
                Spacer()
                Button("Delete Order") {
                    if !orders.orderItems.isEmpty{orders.removeLast()}
                }
                .padding([.top,.bottom], 8)
                .padding([.leading,.trailing], 20)
                .foregroundColor(.white)
                .background(Color("DarkGold"),in: Capsule())
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .shadow(color: Color("DarkGold"),radius:2,x:2,y:2)

                Spacer()
            }
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
