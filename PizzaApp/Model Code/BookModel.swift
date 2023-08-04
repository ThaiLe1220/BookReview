//
//  MenuModel.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

//import Foundation
//
///// An example of a static model that trickles down data through a view hierarchy, but does not change.
//class BookModel{
//
//
//    init(){
//        var _book = decodeJsonFromJsonFile(jsonFileName: "contacts.json")
//        if let bookJSON = decodeJSON(jsonFileName: "contacts.json"){
//            menu = bookJSON.book
//        }
//    }
//
//
//
//    func decodeJsonFromJsonFile(jsonFileName: String)-> Book! {
//
//        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
//            if let data = try? Data(contentsOf: file) {
//                do {
//                    let decoder = JSONDecoder()
//                    let book = try decoder.decode(Book.self, from: data)
//                    return book
//                } catch let error {
//                    fatalError("Failed to decode JSON: \(error)")
//                }
//            }
//        } else {
//            fatalError("Couldn't load \(jsonFileName) file")
//        }
//
//        return nil
//
//    }
//}


import Foundation
import CoreLocation

class BookModel{
    var book:[BookItem] = []
    
    init(){
        book = decodeJsonFromJsonFile(jsonFileName: "bookList.json")
    }
        
    func decodeJsonFromJsonFile(jsonFileName: String) -> [BookItem] {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([BookItem].self, from: data)
                    return decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
        } else {
            fatalError("Couldn't load \(jsonFileName) file")
        }
        return [ ] as [BookItem]
    }

}

