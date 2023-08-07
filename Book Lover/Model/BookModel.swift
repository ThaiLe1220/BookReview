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

