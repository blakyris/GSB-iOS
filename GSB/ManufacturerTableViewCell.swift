//
//  ManufacturerTableViewCell.swift
//  GSB
//
//  Created by Sebastien Mercier on 04.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import UIKit

class ManufacturerTableViewCell: UITableViewCell {

    var manufacturer: Manufacturer!
    
    @IBOutlet weak var manufacturerName: UILabel!
    
    func createCell(manufacturer: Manufacturer)  {
        self.manufacturer = manufacturer
        
        manufacturerName.text = manufacturer.name
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
