//
//  TypeVariableArrayIMG.swift
//  MasterDetail
//
//  Created by vietanh on 1/17/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit
class TypeVariableArrayIMG {
    
    //MARK: Properties
    
    var name: String
    var image: UIImage
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, image: UIImage, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.image = image
        self.rating = rating
    }
}

