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

/// The Model to hold our wishlist.
class WishlistModel: ObservableObject{
    @Published var wishlistItems:[WishlistItem] = []
    var customerName = "Customer Name"
    private var lastID:Int = 0
    
    ///Use only for testing purposes
    init(){
    }
    
    /// Gets a WishlistItem by BookItem Id
    func getWishListItembyBookId(_ item: BookItem) -> Int {
        for wishlistItem in wishlistItems {
            if wishlistItem.bookItem.id == item.id {
                return wishlistItem.id
            }
        }
        return -1
    }
    
    ///Adds a WishlistItem with a BookItem
    func addWishlist(_ item: BookItem){
        lastID += 1
        let newWishlist = WishlistItem(id: (lastID) , bookItem: item)
        wishlistItems.append(newWishlist)
    }
    
    func checkforItemInWishList(_ item: BookItem) -> Bool {
        for wishlistItem in wishlistItems {
            if wishlistItem.bookItem.id == item.id {
                return true
            }
        }
        return false
    }

    /// Removes an Wishlist by id
    func removeWishlist(id: Int){
        if let index = wishlistItems.firstIndex(where: {$0.id == id}){
            wishlistItems.remove(at: index)
        }
    }
    
    /// Removes the last Wishlist
    func removeLast(){
        wishlistItems.removeLast()
    }
}
