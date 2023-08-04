//
//  MenuView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookListView: View {
    var book:[BookItem]

    @Binding var selectedItem: BookItem
    @State private var selectedSortCriteria = BookSortCriteria.nameAsc
    @State private var selectedCategory = BookCategory.empty

    
    var body: some View {
        VStack {
            List {
                Section {
                    if (selectedCategory.rawValue.isEmpty) {
                        ForEach(book.sorted(by: {sortingClosure(criteria: selectedSortCriteria, book1: $0, $1)})) { book in
                            BookRowView(item: book)
                                .onTapGesture {
                                    selectedItem = book
                                }
                                .padding(.leading, -8)
                                .padding(.trailing, -24)

                        }
                    } else {
                        ForEach(book.filter({$0.category == selectedCategory}).sorted(by: {sortingClosure(criteria: selectedSortCriteria, book1: $0, $1)})) { book in
                            BookRowView(item: book)
                                .onTapGesture {
                                    selectedItem = book
                                }
                                .padding(.leading, -8)
                                .padding(.trailing, -24)
                        }
                    }
                } header: {
                    HStack {
                        
                        Text(selectedCategory.rawValue.isEmpty ? "All Books" : "\(selectedCategory.rawValue)")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(-18)
                            .foregroundColor(Color("DarkGold"))
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            Picker(selection: $selectedCategory, label: Text("Category Sort")) {
                                ForEach(BookCategory.allCases, id:\.self){category in
                                    category.rawValue.isEmpty ? Text("All Books").tag(category) :
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .frame(width: 240, height: 30)
                            .pickerStyle(MenuPickerStyle())
                            .padding(-4)
                            
                            Picker(selection: $selectedSortCriteria, label: Text("Sort Criteria")) {
                                ForEach(BookSortCriteria.allCases, id: \.self) { sortOption in
                                    Text("\(sortOption.rawValue)").tag(sortOption)
                                }
                            }
                            .frame(width: 240, height: 30)
                            .pickerStyle(MenuPickerStyle())
                            .padding(-4)
                        }
                        .padding(.trailing, -24)

                    }
                    .frame(height: 60)
                }
            }

            
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView(book: BookModel().book, selectedItem: .constant(testBookItem))
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
