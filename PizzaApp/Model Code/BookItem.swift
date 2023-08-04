//
//  MenuItem.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import Foundation

/// Defines a Book item
struct BookItem:Codable,Hashable,Identifiable, Equatable{
    var id:Int
    var author:String
    var category:BookCategory
    var name:String
    var description:String
    var format:BookFormat
    var price:Int
    var rating:Int
}

enum BookCategory: String, Codable, CaseIterable {
    case art = "Art & Photography"
//    case biographies = "Biographies"
    case business = "Business & Money"
//    case computer = "Computer & Technology"
//    case education = "Education & Teaching"
//    case food = "Cookbooks, Food & Wine"
//    case health = "Health, Fitness & Diet"
//    case law = "Law"
//    case parent = "Parenting & Relationship"
    case sciencefiction = "Science Fiction"
    case selfhelp = "Self-Help"
//    case sport = "Sports"
//    case travel = "Travel"
    case empty = ""
}

enum BookFormat: String, Codable, CaseIterable {
    case kindle = "Kindle"
    case audio = "Audiobook"
    case hardcover = "Hardcover"
    case paperpack = "Paperback"
    case empty = ""
}

enum BookSortCriteria: String, Codable, CaseIterable {
    case nameAsc = "Name (Asc)"
    case nameDesc = "Name(Desc)"
    case idAsc = "ID (Asc)"
    case idDesc = "ID(Desc)"
    case priceAsc = "Price (Asc)"
    case priceDesc = "Price()"
}

/// A test BookItem for previews while composing views
let testBookItem = BookItem(id: 1, author: "Frank Herbert", category: .sciencefiction, name: "Dune (Chronicles, Book 1)", description: "Set on the desert planet Arrakis, Dune is the story of Paul Atreides−who would become known as Maud'Dib—and of a great family's ambition to bring to fruition humankind’s most ancient and unattainable dream.\nA stunning blend of adventure and mysticism, environmentalism and politics, Dune won the first Nebula Award, shared the Hugo Award, and formed the basis of what is undoubtedly the grandest epic in science fiction.", format: .hardcover, price: 240000, rating: 5)

/// used when there is no Book Item
let noBookItem = BookItem(id: -1, author: "", category: .empty, name: "", description: "", format: .empty, price: 0, rating: 0)
