//
//  ProductTableCell.swift
//  GSB
//
//  Created by Sebastien Mercier on 05.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell
{

    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
