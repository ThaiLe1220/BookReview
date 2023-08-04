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
    @State private var selectedSortCriteria = BookSortCriteria.nameAsc

    var body: some View {

        List {
            Section {
                ForEach(book.sorted(by: {sortingClosure(criteria: selectedSortCriteria, book1: $0, $1)})){ item in
                    BookRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                        .padding([.leading, .trailing], -8)

                }
            } header: {
                HStack {
                    Text("All Books").font(.system(size: 16))
                    Spacer()
                    Picker(selection: $selectedSortCriteria, label: Text("")) {
                        ForEach(BookSortCriteria.allCases, id: \.self) { sortOption in
                            HStack {
                                Text("\(sortOption.rawValue)")                                     .tag(sortOption)
                                }
                        }
                    }
//                    .pickerStyle(.menu)
                    .frame(width: 150)
                    .padding(.trailing, -24)
                }
                .frame(height: 20)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: BookModel().book, selectedItem: .constant(testBookItem))
    }
}

private func incrementVal(_ val: inout Int) {
    val += 1
}

// Sorting closure based on selected criteria
private func sortingClosure( criteria: BookSortCriteria,  book1: BookItem, _ book2: BookItem) -> Bool {
    switch criteria {
    case .nameAsc:
        return book1.name < book2.name
    case .nameDesc:
        return book1.name > book2.name
    case .idAsc:
        return book1.id < book2.id
    case .idDesc:
        return book1.id > book2.id
    case .priceAsc:
        return book1.price < book2.price
    case .priceDesc:
        return book1.price > book2.price
    }
}
