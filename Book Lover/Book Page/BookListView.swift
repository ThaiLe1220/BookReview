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

struct BookListView: View {
    var book:[BookItem]

    @Binding var selectedItem: BookItem
    @State private var selectedSortCriteria = BookSortCriteria.nameAsc
    @State private var selectedCategory = BookCategory.empty

    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    Section {
                        if (selectedCategory.rawValue.isEmpty) {
                            ForEach(book.sorted(by: {sortingClosure(criteria: selectedSortCriteria, book1: $0, $1)})) { book in
                                BookRowView(item: book)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.6)) {
                                            selectedItem = book
                                        }
                                    }
                                    .padding(.leading, -8)
                                    .padding(.trailing, -24)
                            }
                        } else {
                            ForEach(book.filter({$0.category == selectedCategory}).sorted(by: {sortingClosure(criteria: selectedSortCriteria, book1: $0, $1)})) { book in
                                BookRowView(item: book)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.6)) {
                                            selectedItem = book
                                        }
                                    }
                                    .padding(.leading, -8)
                                    .padding(.trailing, -24)
                            }
                        }
                    } header: {
                        HStack {
                            
                            Text(selectedCategory.rawValue.isEmpty ? "All Books" : "\(selectedCategory.rawValue)")
                                .font(.system(size: 18, weight: .semibold, design: .default))
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
                                .frame(width: 220, height: 30)
                                .pickerStyle(MenuPickerStyle())
                                .padding(-6)
                                
                                Picker(selection: $selectedSortCriteria, label: Text("Sort Criteria")) {
                                    ForEach(BookSortCriteria.allCases, id: \.self) { sortOption in
                                        Text("\(sortOption.rawValue)").tag(sortOption)
                                    }
                                }
                                .frame(width: 220, height: 30)
                                .pickerStyle(MenuPickerStyle())
                                .padding(-6)
                            }
                            .padding(.trailing, -36)

                        }
                        .frame(height: 60)
                    }
                }
            }
            .frame(maxHeight: geometry.size.height * 0.999)
            .fontDesign(.serif)
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
    case .priceAsc:
        return book1.price < book2.price
    case .priceDesc:
        return book1.price > book2.price
    }
}
