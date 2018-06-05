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

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var products: [Product] = [Product]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        /* Fetch data from API and refresh the TableView */
        
        let urlString = "http://51.38.235.63/api/get/products"
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            if (response.result.isSuccess)
            {
                
                let json : JSON = JSON(response.result.value!)
                var i: Int = 0
                while i < 10 {
                    self.products.append(Product.init(
                        name: json[i]["name"].stringValue,
                        manufacturer: json[i]["manufacturer"].stringValue,
                        price: json[i]["price"].stringValue
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath) as! ProductTableCell
        
        cell.productName.text = products[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
}
