//
//  FBag.swift
//  Blagaprint
//
//  Created by Иван Магда on 19.02.16.
//  Copyright © 2016 Blagaprint. All rights reserved.
//

import Foundation
import Firebase

class FBag {
    
    //--------------------------------------
    // MARK: - Types
    //--------------------------------------
    
    enum Key: String {
        case userId
        case items
    }
    
    //--------------------------------------
    // MARK: - Properties
    //--------------------------------------
    
    var key: String
    
    var reference: Firebase
    
    var userId: String!
    var items: [String]?
 
    var value: Dictionary<String, AnyObject> {
        var dictionary = [String : AnyObject]()

        dictionary[Key.userId.rawValue] = userId
        
        if let items = items {
            dictionary[Key.items.rawValue] = items
        }
        
        return dictionary
    }
    
    //--------------------------------------
    // MARK: - Initialize -
    //--------------------------------------
    
    /// Initialize the new Bag
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.key = key
        
        for (key, value) in dictionary {
            let type = Key(rawValue: key)
            
            if let type = type {
                
                switch type {
                case .userId:
                    userId = value as! String
                case .items:
                    items = value as? [String]
                }
                
            } else {
                print("Unsopported key: \(key)")
            }
        }
        
        reference = DataService.sharedInstance.bagReference.childByAppendingPath(self.key)
    }
}
