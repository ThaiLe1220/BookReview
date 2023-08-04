//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookItemView: View {
    @State var bookmarked:Bool = false
    @State private var addedItem:Bool = false
    @State var presentAlert :Bool = false
    
    @Binding var selectedBookItem:BookItem
    @ObservedObject var orders: OrderModel
    @ObservedObject var wishlists :WishlistModel
    
    @State private var newOrder:Bool = true
    @State private var order = noOrderItem
    
    var body: some View {
        VStack{
            GeometryReader{ geometry in
                HStack {
                    Spacer()
                    
                    VStack (alignment: .trailing) {
                        Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                            .onTapGesture {
                                bookmarked.toggle()
                                bookmarked ?  wishlists.addWishlist(selectedBookItem) : wishlists.removeWishlist(id: selectedBookItem.id)
                            }
                            .font(.system(size: 20))
                            .foregroundColor(Color("DarkGold"))
                            .padding(.top, 2)
                            .padding(.bottom, -4)
                        
                        if let image = UIImage(named: "duneBook\(selectedBookItem.id)"){
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
                    }
                    .onAppear{
                        bookmarked = wishlists.checkforItemInWishList(selectedBookItem)
                    }
                    
                    
                    Spacer()
                    
                    VStack {
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text(selectedBookItem.name)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(Color("SealBrown").opacity(0.7))
                                
                                Text("By Frank Herbert")
                                    .font(.system(size: 12))
                                
                                HStack (alignment: .center) {
                                    RatingsView(rating: selectedBookItem.rating)
                                        .font(.system(size: 12))

                                    Text("\(selectedBookItem.rating)")
                                        .font(.system(size: 13, weight: .semibold))
                                    
                                    Spacer()
                                    Text(selectedBookItem.price, format: .currency(code: "VND"))
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                                .padding(.leading, 6)
                                .padding(.top, -4)

                                
                            }
                            .frame(width: geometry.size.width * 0.6)
                            
                            Button{
                                presentAlert = true
                                addedItem = true
                                order = OrderItem(id: -1 , item: selectedBookItem, quantity: 1)
                            } label: {
                                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                                    .font(.system(size: 24))
                            }
                            .disabled(selectedBookItem.id < 0)
                            .frame(width: geometry.size.width * 0.1)
                            .foregroundStyle(.orange)
                            .sheet(isPresented: $presentAlert){
                                addedItem = true
                            } content: {
                                OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
                            }
                        }
                        
                        
                        ScrollView   {
                            Text(selectedBookItem.description)
                                .font(.custom("Georgia", fixedSize: 12))
                        }
                        .foregroundStyle(Color("SealBrown").opacity(0.9))
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.top, -4)
                    }
                }
            }
        }
        .onChange(of: selectedBookItem, perform: { newValue in
            bookmarked = wishlists.checkforItemInWishList(selectedBookItem)
        })
        .frame(height: 220)
        .padding(.trailing, 8)
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(selectedBookItem: .constant(testBookItem), orders: OrderModel(), wishlists: WishlistModel())
    }
}
