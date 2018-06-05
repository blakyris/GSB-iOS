//
//  ExpenseReport.swift
//  GSB
//
//  Created by Sebastien Mercier on 05.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import Foundation

class ExpenseReport {
    
    private var _reference: String
    private var _amount: String
    
    var reference: String {
        return _reference
    }
    
    var amount: String {
        return _amount
    }

    init(reference: String, amount: String)
    {
        _reference = reference
        _amount = amount
    }
    
}
