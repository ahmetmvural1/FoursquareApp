//
//  AppVariables.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import Foundation

let apiURL = "https://api.foursquare.com"
let client_id = "KLZGMYBZPE1GXTPMYJF1RILL1A1LWP3FPUICTSJ0JRQB5ZC1"
let client_secret = "25I4L0L4GCKSHTCS0Z24SCJBKUFVWS5JVOUPAQBOTYUTR5VB"

var MekanlarArray : [(id: String, name: String)] = []
var DetailArray : [(id: String, name: String, address:String, lat: Float, lng: Float,rating: Float,prefix:String,suffix: String)] = []
