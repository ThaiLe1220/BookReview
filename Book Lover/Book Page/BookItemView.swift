//
//  MenuItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookItemView: View {
    @State var bookmarked: Bool = false
    @State var presentOrderSheet: Bool = false
    
    @Binding var selectedBookItem: BookItem
    @ObservedObject var orders: OrderModel
    @ObservedObject var wishlists: WishlistModel
    
    @State private var newOrder: Bool = true
    @State private var order = noOrderItem

    var body: some View {
        VStack{
            GeometryReader{ geometry in
                NavigationStack {
                    HStack {
                        Spacer()
                        
                        VStack {
                            HStack (alignment: .top) {
                                Image(systemName: "xmark")
                                    .onTapGesture {
                                        withAnimation(.easeIn(duration: 0.3)) {
                                            selectedBookItem = noBookItem
                                        }
                                    }
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("DarkGold"))
                                
                                Spacer()
                                
                                Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                                    .onTapGesture {
                                        bookmarked.toggle()
                                        bookmarked ?  wishlists.addWishlist(selectedBookItem) : wishlists.removeWishlist(id: selectedBookItem.id)
                                    }
                                    .font(.system(size: 18))
                                    .foregroundColor(Color("DarkGold"))
                            }
                            .padding(.bottom, -4)
                            
                            if let image = UIImage(named: "book\(selectedBookItem.id)"){
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(3)
                                    .frame(height: 160)
                                    .shadow(color: Color("DarkGold"), radius: 2, x: 2, y: 2)
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
                                    ZStack (alignment: .leading) {
                                        Text(selectedBookItem.name)
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundStyle(Color("SealBrown").opacity(0.8))
                                            .padding(.leading, -1)
                                    }
                           
                                    Text("By \(selectedBookItem.author)")
                                        .font(.system(size: 12))
                                    
                                    HStack (alignment: .center) {
                                        RatingsView(rating: selectedBookItem.rating)
                                            .font(.system(size: 12))

                                        Text("\(selectedBookItem.rating)")
                                            .font(.system(size: 13, weight: .semibold))
                                        
                                        Spacer()
                                        Text(selectedBookItem.price, format: .currency(code: "VND"))
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(Color("OrangePeel"))
                                    }
                                    .padding(.leading, 2)
                                    
                                }
                                .frame(width: geometry.size.width * 0.6)
                                .padding(.trailing,-12)

                                Button{
                                    presentOrderSheet = true
                                    order = OrderItem(id: -1 , item: selectedBookItem, quantity: 1)
                                } label: {
                                    Image(systemName: orders.checkforItemInOrder(selectedBookItem) ? "cart.fill.badge.plus" : "cart.badge.plus")
                                        .font(.system(size: 20))
                                }
                                .disabled(selectedBookItem.id < 0)
                                .frame(width: geometry.size.width * 0.1)
                                .foregroundStyle(Color("OrangePeel"))
                                .sheet(isPresented: $presentOrderSheet){

                                } content: {
                                    OrderFromBookItemView(orderItem: $order, presentSheet: $presentOrderSheet, newOrder: $newOrder)
                                }
                            }
                
                            ScrollView   {
                                Text(selectedBookItem.description)
                                    .font(.system(size: 12))
                            }
                            .foregroundStyle(Color("SealBrown").opacity(0.8))
                            .frame(width: geometry.size.width * 0.7)
                        }
                    }
                    .padding(.top, 4)
                }
            }
        }
        .fontDesign(.serif)
        .onChange(of: selectedBookItem, perform: { newValue in
            bookmarked = wishlists.checkforItemInWishList(selectedBookItem)
        })
        .frame(height: 240)
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(selectedBookItem: .constant(testBookItem), orders: OrderModel(), wishlists: WishlistModel())
    }
}
