//
//  MenuView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookView: View {
    
    var book:[BookItem]
    
    @Binding var selectedItem: BookItem
    
    
    var body: some View {
        List (BookCategory.allCases, id:\.self){ category in
            Section {
                ForEach(book.filter({$0.category == category})){ item in
                    BookRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                        .padding([.leading, .trailing], -8)
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: BookModel().book, selectedItem: .constant(testBookItem))
    }
}
