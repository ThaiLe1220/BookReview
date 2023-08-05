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
            NavigationStack {
                HStack {
                    Text("ORDER")
                        .font(.system(size: 26))
                        .fontWeight(.semibold)
                        .padding(.leading, 16)
                    Spacer()
                }
                
                List($orders.orderItems){ $order in
                    NavigationLink(value: order){
                        OrderRowView(order: $order)
                            .padding(.leading, -12)
                    }
                    
                    .navigationDestination(for: OrderItem.self) { order in
                        OrderItemView(orderItem: $order)
                    }
                }
                .padding(.top, -12)
            }
//
//            HStack {
//                Spacer()
//                Button("Delete Order") {
//                    if !orders.orderItems.isEmpty{orders.removeLast()}
//                }
//                .padding([.top,.bottom], 8)
//                .padding([.leading,.trailing], 20)
//                .foregroundColor(.white)
//                .background(Color("DarkGold"),in: Capsule())
//                .font(.system(size: 20, weight: .semibold))
//                .shadow(color: Color("DarkGold"),radius:2,x:2,y:2)
//
//                Spacer()
//            }
        }
        .background(.thinMaterial)
        .fontDesign(.serif)

    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
