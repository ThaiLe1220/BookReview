//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookItemView: View {
    @State private var addedItem:Bool = false
    @State var presentAlert :Bool = false
    
    @Binding var item:BookItem
    @ObservedObject var orders: OrderModel
    
    @State private var newOrder:Bool = true
    @State private var order = noOrderItem
    
    var body: some View {
        VStack{
            GeometryReader{ geometry in
                HStack {
                    Spacer()
                    
                    if let image = UIImage(named: "duneBook\(item.id)"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 160)
                            .shadow(color: Color("DarkGold"), radius: 4, x: 2, y: 2)
                    } else {
                        Image("bookError")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 160)
                            .shadow(color: Color("DarkGold"), radius: 4, x: 2, y: 2)
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("SealBrown").opacity(0.7))
                                
                                Text("By Frank Herbert")
                                    .font(.system(size: 12))
                                
                                HStack {
                                    RatingsView(rating: item.rating)
                                    Text("\(item.rating)").bold()
                                    Spacer()
                                    Text(item.price, format: .currency(code: "VND"))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.orange)
                                }
                                .font(.system(size: 12))
                                .padding(.leading, 5)
                                
                            }
                            .frame(width: geometry.size.width * 0.6)
                            
                            
                            
                            Button{
                                presentAlert = true
                                addedItem = true
                                order = OrderItem(id: -1 , item: item, quantity: 1)
                            } label: {
                                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                            }
                            .disabled(item.id < 0)
                            .frame(width: geometry.size.width * 0.1)
                            .padding(.top, 20)
                            .foregroundStyle(.orange)
                            .sheet(isPresented: $presentAlert){
                                addedItem = true
                            } content: {
                                OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
                            }
                            
                            
                        }
                        
                        
                        ScrollView  {
                            Text(item.description)
                                .font(.custom("Georgia", fixedSize: 12))
                        }
                        .foregroundStyle(Color("SealBrown").opacity(0.9))
                        .frame(width: geometry.size.width * 0.7)
                        
                    }
                    //                .background(.linearGradient(colors: [Color("DarkGold").opacity(0.7), Color("CrayolaGold"), Color("Sky").opacity(0.7)], startPoint: .leading, endPoint: .trailing))
                    .padding(1)
                    
                    
                }
            }
        }
        .frame(height: 220)
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(item: .constant(testBookItem), orders: OrderModel())
    }
}
