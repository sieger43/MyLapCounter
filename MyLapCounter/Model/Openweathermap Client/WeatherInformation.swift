//
//  WeatherInformation.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/18/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//
import Foundation
import UIKit

struct WeatherInformation : Codable {
    let coord : WeatherCoord?
    let weather : [WeatherCond]?
    let base : String?
    let main : WeatherMain?
    let visibility : Int?
    let wind: WeatherWind?
    let clouds : WeatherClouds?
    let dt : Int?
    let sys : WeatherSys?
    let timezone : Int?
    let id : Int?
    let name : String?
    let cod : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case timezone
        case id
        case name
        case cod
    }
}

struct WeatherCoord : Codable {
    let lat : Double?
    let lon : Double?
}

struct WeatherCond : Codable {
    let id : Int?
    let main : String?
    let description : String?
    let icon : String
}

struct WeatherMain : Codable {
    let temp : Double?
    let pressure : Int?
    let humidity : Int?
    let temp_min : Double?
    let temp_max : Double?
}

struct WeatherWind : Codable {
    let speed : Double?
    let deg : Int?
}

struct WeatherClouds : Codable {
    let all : Int?
}

struct WeatherSys : Codable {
    let type : Int?
    let id : Int?
    let country : String?
    let sunrise : Int?
    let sunset : Int?
    
}
