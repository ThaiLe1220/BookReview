//
//  SearchView.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var book:[BookItem]

    @ObservedObject var orders: OrderModel
    @ObservedObject var wishlists :WishlistModel
    

    
    var filterdItems: [BookItem] {
        if searchText.isEmpty {
            return book
        } else {
            return book.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText).padding()
                
                List(filterdItems) { bookItem in    
//                    NavigationLink (destination: DetailView(bookItem: bookItem)) {
                        NavigationLink (destination: BookDetailView(selectedBookItem: bookItem, orders: orders, wishlists: wishlists)) {
                        Text(bookItem.name)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(book: BookModel().book, orders: OrderModel(), wishlists: WishlistModel())
    }
}

struct DetailView: View {
    var bookItem: BookItem
    
    var body: some View {
        VStack{
            Text(bookItem.name)
        }
       
    }
}
