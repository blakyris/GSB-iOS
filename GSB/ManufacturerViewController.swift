
//
//  ProductViewController.swift
//  GSB
//
//  Created by Sebastien Mercier on 05.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ManufacturerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var manufacturers: [Manufacturer] = [Manufacturer]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        /* Fetch data from API and refresh the TableView */
        
        let urlString = "http://127.0.0.1:8080/api/get/manufacturers"
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            if (response.result.isSuccess)
            {
                
                let json : JSON = JSON(response.result.value!)
                var i: Int = 0
                while i < 10 {
                    self.manufacturers.append(Manufacturer.init(
                        name: json[i]["name"].stringValue,
                        addr: json[i]["addr"].stringValue,
                        zip: json[i]["zip"].stringValue,
                        city: json[i]["city"].stringValue
                    ))
                    i = i + 1
                }
                self.tableView.reloadData()
            } else {
                let alert = UIAlertController(
                    title: "API Error",
                    message: "Can't fecth data from Symfony API.",
                    preferredStyle: .alert
                )
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        /* End fecth data */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManufacturerTableCell", for: indexPath) as! ManufacturerTableCell
        
        cell.manufacturerName.text = manufacturers[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manufacturers.count
    }
}
