//
//  MenuViewController.swift
//  GSB
//
//  Created by Sebastien Mercier on 03.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var manufacturerButton: UIButton!
    @IBOutlet weak var productButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func GoToManufacturer(_ sender: Any) {
        performSegue(withIdentifier: "manufacturerSegue", sender: self)
    }
    
    @IBAction func GoToProducts(_ sender: Any) {
        performSegue(withIdentifier: "productSegue", sender: self)
    }
    
    @IBAction func GoToReports(_ sender: Any) {
        performSegue(withIdentifier: "expenseReportSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
