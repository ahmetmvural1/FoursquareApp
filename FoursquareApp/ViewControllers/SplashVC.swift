//
//  SplashVC.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//


import UIKit
import Lottie

class SplashVC: UIViewController {

    @IBOutlet weak var animeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
      
          let animationView = AnimationView(name: "1055-world-locations")
           animationView.frame = CGRect(x: 0, y: 0 , width: animeView.frame.width, height: animeView.frame.height)
        animationView.contentMode = .scaleAspectFill
           self.animeView.addSubview(animationView)
          animationView.play { (true) in
              let rocketListVC = self.storyboard!.instantiateViewController(withIdentifier: "CityVC") as! CityVC
            self.presentVC(vc: rocketListVC, duration: 0.3, type: .fromLeft)

          }
      }

}
