//
//  WeatherErrorResponse.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/18/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import Foundation
import UIKit

struct WeatherErrorResponse: Codable {
    
    // Example Error Response:
    //
    // {"cod":401, "message": "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."}
    //
    // {"cod": 429,"message": "Your account is temporary blocked due to exceeding of requests limitation of your
    //  subscription type. Please choose the proper subscription http://openweathermap.org/price" }
    
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
}

extension WeatherErrorResponse: LocalizedError {
    var errorDescription: String? {
        return message
    }
}
