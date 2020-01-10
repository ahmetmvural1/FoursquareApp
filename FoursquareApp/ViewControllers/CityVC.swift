//
//  CityVC.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import SVProgressHUD

class CityVC: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    var dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

    }
    

    
    func getList(city: String?){
        

        let listVC = self.storyboard!.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        listVC.city = city!
        self.navigationController!.pushViewController(listVC, animated: true)
    }
    

    
    @IBAction func searchButton(_ sender: Any) {
        var city = cityTextField.text!
        if city == ""{
            city = "istanbul"
        }
        getList(city: city)
    }


}
