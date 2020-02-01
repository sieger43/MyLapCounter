//
//  OpenWeatherClient.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/18/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import Foundation
import UIKit

class OpenWeatherClient
{
    static let apiKey = ""
    
    enum Endpoints {
        static let base = "https://api.openweathermap.org/data/2.5"
        
        case currentweather
        
        var stringValue : String {
            switch self {
            case .currentweather: return Endpoints.base + "/weather"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
        
    }
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, queryItems: [URLQueryItem], responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        var finalURL:URL = url;
        
        var components = URLComponents(url: finalURL, resolvingAgainstBaseURL: false)!
        
        components.queryItems = queryItems
        
        if let urlWithQuery = components.url {
            
            finalURL = urlWithQuery
        }
        
        let request = URLRequest(url: finalURL)
        // The default HTTP method for URLRequest is “GET”.
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(WeatherErrorResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        
        return task
    }
    
    class func getCurrentWeather(lat : Double, lon : Double, completion: @escaping (Bool, Error?, WeatherInformation?) -> Void) {
        
        // Example URL:
        //
        // http://api.openweathermap.org/data/2.5/weather?lat=43.21&lon=-77.69&APPID=f3d151ecf10d27b33ad637e6ab726aa1&units=imperial
        
        let qItems = [URLQueryItem(name: "lat", value : String(format:"%f", lat)),
                      URLQueryItem(name: "lon", value : String(format:"%f", lon)),
                      URLQueryItem(name: "APPID", value: apiKey),
                      URLQueryItem(name: "units", value: "imperial")]
        
        let _ = taskForGETRequest(url: Endpoints.currentweather.url, queryItems: qItems, responseType: WeatherInformation.self) { response, error in
            if let response = response {
                completion(true, nil, response)
            } else {
                completion(false, error, nil)
            }
        }
    }
}

