//
//  ViewController.swift
//  GSB
//
//  Created by Sebastien Mercier on 03.06.18.
//  Copyright © 2018 Galaxy Swiss Bourdin. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController {


    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func connectButtonPressed(_ sender: Any) {
        if (usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty)
        {
            let alert = UIAlertController(
                title: "Accès sécurisé",
                message: "Veuillez vous connecter afin d'accèder a l'intranet GSB.",
                preferredStyle: .alert
            )
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        } else {

            let credentials = [
                "username" : usernameTextField.text,
                "password" : passwordTextField.text,
            ]
            // Do fetch data from JSON API
            let urlString = "http://127.0.0.1:8080/api/login"
            guard let url = URL(string: urlString) else { return }
            Alamofire.request(url, method: .post, parameters: credentials, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        self.performSegue(withIdentifier: "loginSuccessSegue", sender: self)
                    case .failure(let error):
                        let alert = UIAlertController(
                            title: "Login incorrect",
                            message: "L'identifiant ou le mot de passe est incorrect. Veuillez rééssayer.",
                            preferredStyle: .alert
                        )
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(alertAction)
                        self.present(alert, animated: true, completion: nil)
                    }
            }
            // End fetch Data from JSON API
        }
    }

}

