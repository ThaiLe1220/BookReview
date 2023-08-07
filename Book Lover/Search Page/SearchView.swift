/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Le Hong Thai
  ID: s3752577
  Created  date: 31/7/2023
  Last modified: 7/8/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    SearchBar(searchText: $searchText).padding()
                    
                    List(filterdItems) { bookItem in
                        NavigationLink (destination: BookDetailView(selectedBookItem: bookItem, orders: orders, wishlists: wishlists).padding(.horizontal, 4)) {
                            Text(bookItem.name)
                        }
                    }
                }
            }
            .frame(height: geometry.size.height * 0.999)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(book: BookModel().book, orders: OrderModel(), wishlists: WishlistModel())
    }
}
