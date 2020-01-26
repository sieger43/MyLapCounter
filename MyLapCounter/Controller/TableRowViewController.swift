//
//  TableRowViewController.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/25/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import UIKit
import CoreLocation

class TableRowViewController: UIViewController {
    
    var lat : Double = 0.0
    var lon : Double = 0.0
    var lapTime : String = "unknown"
    var lapDate : Date = Date()

    @IBOutlet weak var lapTimeLabel: UILabel!
    @IBOutlet weak var lapWhenLabel: UILabel!
    @IBOutlet weak var lapStreetLabel: UILabel!
    @IBOutlet weak var lapTownLabel: UILabel!
    @IBOutlet weak var latLonLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lapTimeLabel.text = lapTime
        lapWhenLabel.text = TimeDateUtils.timeDate(dateTimeToDisplay: lapDate)
        latLonLabel.text = "lat " + String(format:"%.5f", lat) + ", " +
            "lon " + String(format:"%.5f", lon)
        
        let location : CLLocation = CLLocation(latitude: lat, longitude: lon)
        
        let geocoder = CLGeocoder()
        
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(location,
                completionHandler: { (placemarks, error) in
                    if error == nil {
                        let firstLocation = placemarks?[0]
                        if let name = firstLocation?.name, let town = firstLocation?.locality, let zip = firstLocation?.postalCode {
                            self.lapStreetLabel.text = name
                            self.lapTownLabel.text = town + " " + zip
                        }
                    }
                    else {
                        // An error occurred during geocoding.
                        self.lapStreetLabel.text = "unknown"
                        self.lapTownLabel.text = "unknown"
                    }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
