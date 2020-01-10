//
//  ListVC.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa
import SDWebImage
import FontAwesome_swift

class ListVC: UIViewController , UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var disposeBag = DisposeBag()
    var dateFormatter = DateFormatter()
    var city = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

           getMekan(city: city)
        
    }


    func tableViewSource(){
        let items = Observable.just(
            (0..<DetailArray.count).map { "\($0)" }
        )

        items
            .bind(to: tableView.rx.items(cellIdentifier: "VenuesCell", cellType: VenuesCell.self)) { (row, element, cell) in
                             
                cell.NameLabel.text = DetailArray[row].name
                cell.AddressLabel.text = DetailArray[row].address
                cell.RatingLabel.text = String(DetailArray[row].rating)
                
            }
            .disposed(by: disposeBag)


        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VenueDetailVC") as! VenueDetailVC

                self.addChild(popvc)
                popvc.view.frame = self.view.frame
                popvc.lat = DetailArray[Int(value)!].lat
                popvc.lng = DetailArray[Int(value)!].lng
                popvc.name = DetailArray[Int(value)!].name
                popvc.prefix = DetailArray[Int(value)!].prefix
                popvc.suffix = DetailArray[Int(value)!].suffix
                self.view.addSubview(popvc.view)
                popvc.didMove(toParent: self)
            })
            .disposed(by: disposeBag)


    }
        
    func getMekan(city: String?){
            
            dateFormatter.dateFormat = "YYYYMMdd"
            let v = dateFormatter.string(from: Date())

            ApiClient.shared.listVenues(v: v, near: city! ).observe(onStart: {
                SVProgressHUD.show(withStatus: "Yükleniyor")
            }, onEnd: {
               print("end")
            }, onSuccess: { (result) in
                result.response?.venues.forEach({ (Venues) in
                    MekanlarArray.append((id: Venues.id!, name: Venues.name!))
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    guard let self = self else {
                       
                      return
                        }
                         self.getMekanDetail(id: Venues.id!, name: Venues.name!)
                        
                    }
                })
           
            }) { (error) in
                self.alert(message: error.localizedDescription, title: "Error")
                
            }

        }
    
    func getMekanDetail(id: String?, name: String?){
        
        dateFormatter.dateFormat = "YYYYMMdd"
        let v = dateFormatter.string(from: Date())
        
        ApiClient.shared.detailVenues(v: v, venuesID: id!).observe(onStart: {
                SVProgressHUD.show(withStatus: "Yükleniyor")
            }, onEnd: {
                print("end")
            }, onSuccess: { (result) in
                DetailArray.append((id: id!,
                    name: name!,
                    address: (result.respons?.venue.location?.address ??  "Not Found"),
                                    lat: (result.respons?.venue.location?.lat)!,
                                    lng: (result.respons?.venue.location?.lng)!,
                                    rating: (result.respons?.venue.rating ?? 0.0),
                                    prefix: (result.respons?.venue.photos?.groups?[0].items?[0].prefix ?? "Not Found"),
                                    suffix:(result.respons?.venue.photos?.groups?[0].items?[0].suffix) ?? "Not Found"))
                
                if MekanlarArray.count == DetailArray.count{
                   SVProgressHUD.dismiss()
                    self.tableViewSource()
                }
              

                
            }) { (error) in
                self.alert(message: error.localizedDescription, title: "Error")

                
            }
        }

}
