//
//  Photo.swift
//  MasterDetail
//
//  Created by Anhdzai on 1/10/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit
class TypeArrayIMG {
    
    //MARK: Properties
    
    var name: String
    var urlTextIMG: String
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, urlTextIMG: String, rating: Int) {
        
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
        self.urlTextIMG = urlTextIMG
        self.rating = rating
    }
}
