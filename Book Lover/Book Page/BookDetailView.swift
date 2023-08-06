//
//  MenuDetailView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct BookDetailView: View {
    @State var bookmarked:Bool = false
    @State var presentOrderSheet :Bool = false
    
    var selectedBookItem:BookItem
    @ObservedObject var orders: OrderModel
    @ObservedObject var wishlists :WishlistModel
    
    @State private var newOrder:Bool = true
    @State private var order = noOrderItem

    var body: some View {
        GeometryReader{ geometry in
            VStack (alignment: .leading, spacing: 16){
                ZStack () {
                    if let image = UIImage(named: "book\(selectedBookItem.id)"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 220)
                            .shadow(color: Color("DarkGold"), radius: 4, x: 2, y: 2)
                    }
                    
                    Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                        .onTapGesture {
                            bookmarked.toggle()
                            bookmarked ?  wishlists.addWishlist(selectedBookItem) : wishlists.removeWishlist(id: selectedBookItem.id)
                        }
                        .offset(x: geometry.size.width * -0.45, y: 220 * -0.4)
                        .font(.system(size: 22))
                        .foregroundColor(Color("DarkGold"))
                    
                    Button {
                        presentOrderSheet = true
                        order = OrderItem(id: -1 , item: selectedBookItem, quantity: 1)
                    } label: {
                        Image(systemName: orders.checkforItemInOrder(selectedBookItem) ? "cart.fill.badge.plus" : "cart.badge.plus")
                            .font(.system(size: 22))
                    }
                    .offset(x: geometry.size.width * 0.43, y: 220 * -0.4)
                    .disabled(selectedBookItem.id < 0)
                    .foregroundStyle(Color("OrangePeel"))
                    .sheet(isPresented: $presentOrderSheet){
                        
                    } content: {
                        OrderFromBookDetailView(orderItem: $order, presentSheet: $presentOrderSheet, newOrder: $newOrder)
                    }
                }
                .frame(width: geometry.size.width)

                VStack (alignment: .leading, spacing: 4) {
                    Text(selectedBookItem.name)
                        .foregroundStyle(Color("SealBrown").opacity(0.8))
                        .font(.system(size: 20, weight: .semibold))

                    Text("By \(selectedBookItem.author)")
                        .font(.system(size: 15, weight: .regular)).italic()
                        .foregroundStyle(Color("SealBrown").opacity(0.8))

                    HStack (alignment: .center) {
                        RatingsView(rating: selectedBookItem.rating)
                            .font(.system(size: 13, weight: .regular))

                        Text("\(selectedBookItem.rating)")
                            .font(.system(size: 13, weight: .semibold))

                        Spacer()
                        
                        Text(selectedBookItem.price, format: .currency(code: "VND"))
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(Color("OrangePeel"))
                        
                    }
                    .padding(.leading, 6)
                }

                    
                    
                
                HStack {
                    Text("Category:")
                    Text(selectedBookItem.category.rawValue)
                    Spacer()
                }
                .italic()
                .font(.system(size: 14))
                .foregroundStyle(Color("SealBrown").opacity(0.8))

                HStack {
                    Text("Format:")
                    Text(selectedBookItem.format.rawValue)
                    Spacer()
                }
                .italic()
                .font(.system(size: 14))
                .foregroundStyle(Color("SealBrown").opacity(0.8))


                Text(selectedBookItem.headline)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color("SealBrown").opacity(0.8))
                    .frame(width: geometry.size.width)
                    .padding(.leading, -8)
                
                
                Text(selectedBookItem.description)
                    .foregroundStyle(Color("SealBrown").opacity(0.8))
                    .font(.system(size: 14, weight: .regular))
                
            }
        }
        .onAppear(perform: {
            bookmarked = wishlists.checkforItemInWishList(selectedBookItem)
        })

        .fontDesign(.serif)
        
        
    }

}
    


struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(selectedBookItem: testBookItem, orders: OrderModel(), wishlists: WishlistModel())
    }
}
