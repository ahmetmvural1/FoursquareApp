//
//  ListDataVenues.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation

struct ListDataVenues: Decodable {
    var response: Response?
    


    
    private enum CodingKeys: String, CodingKey{
        case response = "response"
       
    }
}

struct Response: Decodable {
   var venues: [Venues]!
    

    private enum CodingKeys: String, CodingKey{

         case venues = "venues"

    }

}
struct Venues: Decodable {
    var id : String?
    var name : String?


    private enum CodingKeys: String, CodingKey{

        case id = "id"
        case name = "name"

    }

}
