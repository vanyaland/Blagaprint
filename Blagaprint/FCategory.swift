//
//  FCategory.swift
//  Blagaprint
//
//  Created by Иван Магда on 18.02.16.
//  Copyright © 2016 Blagaprint. All rights reserved.
//

import Foundation
import Firebase

class FCategory {
    
    //--------------------------------------
    // MARK: - Types
    //--------------------------------------
    
    enum CategoryType: String {
        case phoneCase
        case cup
        case plate
        case photoFrame
        case photoCrystal
        case keyRing
        case clothes
        case copyServices
        case undefined
    }
    
    enum Keys: String {
        case name
        case titleName
        case image
        case type
    }
    
    //--------------------------------------
    // MARK: - Properties -
    //--------------------------------------
    
    var key: String
    
    var reference: Firebase
    
    /// Name of the category.
    var name: String!
    
    /// Uses for title name of any view controller.
    var titleName: String!
    
    /// Image of the category.
    var image: UIImage?
    
    /// Type of the category.
    var type: CategoryType!
    
    //--------------------------------------
    // MARK: - Initialize -
    //--------------------------------------
    
    /// Initialize the new Category
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.key = key
        
        // Within the Category, or Key, the following properties are children
        
        if let name = dictionary[Keys.name.rawValue] as? String {
            self.name = name
        }
        
        if let titleName = dictionary[Keys.titleName.rawValue] as? String {
            self.titleName = titleName
        }
        
        if let base64ImageString = dictionary[Keys.image.rawValue] as? String {
            self.image = base64ImageString.decodedImageFromBase64String()
        }
        
        if let typeString = dictionary[Keys.type.rawValue] as? String {
            self.type = FCategory.typeFromString(typeString)
        }
        
        // The above properties are assigned to their key.
        
        self.reference = DataService.sharedInstance.categoryReference.childByAppendingPath(self.key)
    }
    
    //--------------------------------------
    // MARK: - Helper Methods
    //--------------------------------------

    private class func typeFromString(type: String) -> CategoryType {
        let type = CategoryType(rawValue: type)
        
        return (type == nil ? .undefined : type!)
    }
    
    //--------------------------------------
    // MARK: - Quering
    //--------------------------------------
    
    /// Returns items of the Category.
    func getItemsInBackgroundWithBlock(block: ((objects: [FCategoryItem]?) -> Void)? ) {
        let ref = DataService.sharedInstance.categoryItemReference
        
        DataService.showNetworkIndicator()
        
        ref.queryOrderedByChild(FCategoryItem.Keys.parentCategory.rawValue).queryEqualToValue(self.key).observeEventType(.Value, withBlock: { snapshot in
            
            if snapshot.value is NSNull {
                
                DataService.hideNetworkIndicator()
                
                block?(objects: nil)
                
            } else {
                
                if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                    
                    var items = [FCategoryItem]()
                    
                    for snap in snapshots {
                        
                        // Make our items.
                        
                        // TODO: Implement parsing via generic function.
                        if let dictionary = snap.value as? Dictionary<String, AnyObject> {
                            let key = snap.key
                            let item = FCategoryItem(key: key, dictionary: dictionary)
                            
                            print("CategoryItem \(item)")
                            
                            // Reverse ordered.
                            
                            items.append(item)
                        }
                    }
                    
                    DataService.hideNetworkIndicator()
                    
                    block?(objects: items)
                    
                } else {
                    
                    DataService.hideNetworkIndicator()
                    
                    block?(objects: nil)
                }
            }
        })
    }
}

//--------------------------------------
// MARK: - CustomStringConvertible -
//--------------------------------------

extension FCategory: CustomStringConvertible {
    var description: String {
        return "Name: \(name), type: \(type.rawValue)"
    }
}
    