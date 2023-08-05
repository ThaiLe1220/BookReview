//
//  MenuView2.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct BookView2: View {
    var book:[BookItem]
    @State private var selectedItem:BookItem? = nil
    
    var body: some View {
        NavigationSplitView {
            List(book, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    BookRowView(item: item)
                        .padding([.leading, .trailing], -8)
                }
            }
        } detail: {
        }
    }
}

struct BookView2_Previews: PreviewProvider {
    static var previews: some View {
        BookView2(book: BookModel().book)
    }
}
