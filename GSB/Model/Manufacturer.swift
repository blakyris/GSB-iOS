//
//  Manufacturer.swift
//  GSB
//
//  Created by Sebastien Mercier on 04.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import Foundation

class Manufacturer {
    
    private var _name: String
    private var _addr: String
    private var _zip: String
    private var _city: String
    
    var name: String {
        return _name
    }

    var addr: String {
        return _addr
    }

    var zip: String {
        return _zip
    }
    
    var city: String {
        return _city
    }
    
    init(name: String, addr: String, zip: String, city: String)
    {
        _name = name
        _addr = addr
        _zip = zip
        _city = city
    }
    
}
