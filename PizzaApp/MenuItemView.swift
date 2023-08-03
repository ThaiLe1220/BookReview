//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem:Bool = false
    @State var presentAlert :Bool = false
    
    @Binding var item:MenuItem
    @ObservedObject var orders: OrderModel
    
    @State private var newOrder:Bool = true
    @State private var order = noOrderItem
    
    var body: some View {
        VStack {

            if let image = UIImage(named: "duneBook\(item.id)"){
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .cornerRadius(3)
                    .frame(height: 120)
                    .shadow(color: .brown, radius: 10, x:8, y: 8)
            } else {
                Image("bookError")
                    .resizable()
                    .scaledToFit()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .cornerRadius(3)
                    .frame(height: 120)
            }
            VStack (alignment: .leading) {
                Text(item.name)
                    .frame(width: 100)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.thickMaterial)
//                    .padding(.leading)
                    .background(.linearGradient(colors: [Color("Ocean"), Color("Sky").opacity(0.5)], startPoint: .leading, endPoint: .trailing), in: Capsule())
                    .frame(height: 20)
                
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", fixedSize: 13))
                }
            }
            
            Button{
                presentAlert = true
                addedItem = true

            } label: {
                Spacer()
                Text(item.price, format: .currency(code: "VND")).fontWeight(.bold)
                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0)
            .padding()
            .background(.tint, in:Capsule())
            .foregroundStyle(.white)
            .padding([.leading, .trailing], 8)
           
//            .alert("Buy a\(item.name)", isPresented: $presentAlert) {
//                Button("No", role: .cancel) {}
//                Button("Yes") {
//                    addedItem = true
//                    orders.addOrder(item, quantity: 1)
//                }
//
//            }
            .sheet(isPresented: $presentAlert){
                addedItem = true
//                orders.addOrder(item, quantity: 1)

            } content: {
                OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
    }
}
