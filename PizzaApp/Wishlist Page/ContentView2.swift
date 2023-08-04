//
//  BookWishlistView 2.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 04/08/2023.
//

import SwiftUI

struct ContentView2: View {
    @ObservedObject var wishlists :WishlistModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(wishlists.wishlistItems) { item in
                        HStack {
                            Text(item.bookItem.name)
                            Spacer()
                            Button(action: {
                                wishlists.removeWishlist(id: item.id)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                HStack {
                    Button(action: {
                        wishlists.addWishlist(testBookItem)
                    }) {
                        Label("Add Book to Wishlist", systemImage: "plus")
                    }
                
                    Button(action: {
                        wishlists.removeLast()
                    }) {
                        Label("Remove Last", systemImage: "minus")
                    }
                }
            }
            .navigationBarTitle("Wishlist")
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2(wishlists: WishlistModel())
    }
}
