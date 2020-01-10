//
//  DetailDataVenues.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation

struct DetailDataVenues: Decodable {
    var respons: Respons?
    
    private enum CodingKeys: String, CodingKey{
        case respons = "response"
       
    }
}

struct Respons: Decodable {
   var venue: Venue!
    

    private enum CodingKeys: String, CodingKey{

         case venue = "venue"

    }

}
struct Venue: Decodable {

    var location : Location?
    var photos : Photos?
    var rating : Float?

    private enum CodingKeys: String, CodingKey{

        case location = "location"
        case photos = "photos"
        case rating = "rating"
    }

}

struct Location: Decodable {
    var lat: Float?
    var lng: Float?
    var address: String?
    
    private enum CodingKeys: String, CodingKey{
        case lat = "lat"
        case lng = "lng"
        case address = "address"
    }
}


struct Photos: Decodable {
    var groups: [Groups]?


    
    private enum CodingKeys: String, CodingKey{
        case groups = "groups"
     
    }
}

struct Groups: Decodable {
    var items: [Items]?


    
    private enum CodingKeys: String, CodingKey{
        case items = "items"
     
    }
}

struct Items: Decodable {
    var prefix: String?
    var suffix: String?

    
    private enum CodingKeys: String, CodingKey{
        case prefix = "prefix"
         case suffix = "suffix"
    }
}
