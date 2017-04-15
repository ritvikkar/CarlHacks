//
//  Meal.swift
//  FoodTracker
//
//  Created by Ritvik Kar on 04/15/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import os.log
import UIKit


class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var ingredients: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let ingredients = "ingredients"
    }
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, ingredients: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The ingredents must not be empty
        guard !ingredients.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.ingredients = ingredients
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(ingredients, forKey: PropertyKey.ingredients)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let ingredients = aDecoder.decodeObject(forKey: PropertyKey.ingredients) as? String else {
            os_log("Unable to decode the ingredents for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, ingredients: ingredients)
        
    }
}
