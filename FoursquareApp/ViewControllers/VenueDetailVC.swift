//
//  VenueDetailVC.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 8.01.2020.
//  Copyright © 2020 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import MapKit
import SVProgressHUD
class VenueDetailVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var venueMap: MKMapView!
    @IBOutlet weak var venueImage: UIImageView!
    var lat = Float()
    var lng = Float()
    var name = String()
    var prefix = String()
    var suffix = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimate()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        
      


    }
    override func viewDidAppear(_ animated: Bool) {
        showMaps()
        showImage()
    }
    
    func showImage(){
        
        venueImage.sd_setImage(with: URL(string: "\(prefix)374x193\(suffix)"))
    }
    
    func showMaps(){
        let venue = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng))
        let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng))
        venue.title = name
        venue.coordinate = coordinate
        
        venueMap.addAnnotation(venue)
        venueMap.delegate = self
        centerMapOnLocation(location, mapView: venueMap)
    }
    
    func centerMapOnLocation(_ location: CLLocation, mapView: MKMapView) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        removeAnimate()
    }


    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }

}
