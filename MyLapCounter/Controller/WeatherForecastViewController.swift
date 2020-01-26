//
//  WeatherForecastViewController.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/18/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherForecastViewController: UIViewController {

    var lat : Double = 0.0
    var lon : Double = 0.0
    
    @IBOutlet weak var locationValueLabel: UILabel!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    @IBOutlet weak var conditionsValueLabel: UILabel!
    @IBOutlet weak var windValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lat = (UIApplication.shared.delegate as! AppDelegate).lat
        lon = (UIApplication.shared.delegate as! AppDelegate).lon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateButtonAction(_ sender: Any) {
        
        lat = (UIApplication.shared.delegate as! AppDelegate).lat
        lon = (UIApplication.shared.delegate as! AppDelegate).lon
        
        let location : CLLocation = CLLocation(latitude: lat, longitude: lon)
        
        let geocoder = CLGeocoder()
        
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(location,
            completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    if let name = firstLocation?.name, let zip = firstLocation?.postalCode {
                        self.locationValueLabel.text = name + " " + zip
                    }
                }
                else {
                    // An error occurred during geocoding.
                    self.locationValueLabel.text = "unknown"
                }
        })
        
        OpenWeatherClient.getCurrentWeather(lat: lat, lon: lon){ success, error, response in
            if success {
                if let weatherData = response {
                    if let main = weatherData.main{
                        if let temp = main.temp {
                            self.temperatureValueLabel.text = String(format:"%.0f", temp) + "\u{00B0} F"
                        }
                        if let humidity = main.humidity {
                            self.humidityValueLabel.text = String(format:"%d", humidity) + " %"
                        }
                    }
                    if let conds = weatherData.weather {
                        let c = conds.compactMap( {$0.description })
                        
                        if c.count > 0 {
                            self.conditionsValueLabel.text = c[0]
                        }
                    }
                    
                    if let windData = weatherData.wind, let wind_speed = windData.speed {
                        self.windValueLabel.text = String(format:"%.2f", wind_speed) + " mph"
                    }
                }
                
                let currentTimeDate = TimeDateUtils.timeDate(dateTimeToDisplay: Date())
                if let unwrappedTimeDate = currentTimeDate {
                    self.lastUpdatedLabel.text = "(Last Updated: \(unwrappedTimeDate))"
                }
            }
        }
    }
}
