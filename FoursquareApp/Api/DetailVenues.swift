//
//  DetailVenues.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation
import SimpleApiClient

struct DetailVenues: SimpleApi{
     
    
    var v: String?
    var venuesID: String?
    
    var path: String {
        return "/v2/venues/\(venuesID!)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        return ["client_id": client_id,"client_secret": client_secret,"v": v!]
    }

    var responseKeyPath: String {
        return "data"
    }

}
extension SimpleApiClient {
    func detailVenues(v: String, venuesID: String) -> Observable<DetailDataVenues>  {
        return request(api: DetailVenues(v: v, venuesID: venuesID))
    }
}
