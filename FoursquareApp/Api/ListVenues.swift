//
//  ListVenues.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation
import SimpleApiClient

struct ListVenues: SimpleApi{
     
    
    
    var v: String?
    var near: String?
    
    var path: String {
        return "/v2/venues/search"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        return ["client_id": client_id,"client_secret": client_secret,"v": v!,"near": near!,"intent":"browse","query":"cafe"]
    }



}
extension SimpleApiClient {
    func listVenues(v: String, near: String) -> Observable<ListDataVenues>  {
        return request(api: ListVenues(v: v, near: near))
    }
}
