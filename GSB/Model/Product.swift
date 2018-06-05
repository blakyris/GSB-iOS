//
//  Product.swift
//  GSB
//
//  Created by Sebastien Mercier on 05.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import Foundation

class Product {
    
    private var _name: String
    private var _manufacturer: String
    private var _price: String
    
    var name: String {
        return _name
    }
    
    var manufacturer: String {
        return _manufacturer
    }
    
    var price: String {
        return _price
    }
    
    init(name: String, manufacturer: String, price: String)
    {
        _name = name
        _manufacturer = manufacturer
        _price = price
    }
    
}
