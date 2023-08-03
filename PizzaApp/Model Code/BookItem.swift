//
//  MenuItem.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import Foundation

/// Defines a menu item
struct BookItem:Codable,Hashable,Identifiable{
    var id:Int
    var category:BookCategory
    var name:String
    var description:String
    var crust:BookCrust
    var price:Double
    var rating:Int
    
    /// Custom hash method necessary for navigation paths to use `Hashable` protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    /// Custom equals method necessary for navigation paths to use `Equatable` protocol
    static func ==(lhs:BookItem, rhs:BookItem)->Bool{
        lhs.id == rhs.id &&
        lhs.category == rhs.category &&
        lhs.description == rhs.description &&
        lhs.crust == rhs.crust &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.rating == rhs.rating
        
    }
}

/// The categories of pizzas used
enum BookCategory: String, Codable, CaseIterable {
    case n = "Huli Pizza Originals"
    case italian = "Italian Specialty pizzas"
    case mainland = "Mainland Specialty Pizzas"
}

/// The basic types of pizza crust used.
enum BookCrust: String,Codable,CaseIterable {
    case neopolitan = "Neopolitan"
    case newYork = "New York"
    case calzone = "Calzone"
    case deepDish = "Deep Dish"
    case musubi = "Musubi"
}


/// A test MenuItem for previews while composing views
let testBookItem = BookItem(id: 0, category: .italian, name: "Dune (Chronicles, Book 1)", description: "Set on the desert planet Arrakis, Dune is the story of Paul Atreides−who would become known as Maud'Dib—and of a great family's ambition to bring to fruition humankind’s most ancient and unattainable dream.\nA stunning blend of adventure and mysticism, environmentalism and politics, Dune won the first Nebula Award, shared the Hugo Award, and formed the basis of what is undoubtedly the grandest epic in science fiction.", crust: .neopolitan, price: 240000, rating: 5)

/// used when there is no Menu Item
let noBookItem = BookItem(id: -1, category: .italian, name: "", description: "", crust: .neopolitan, price: 0, rating: 0)
