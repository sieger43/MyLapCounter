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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var lat = (UIApplication.shared.delegate as! AppDelegate).lat
        var lon = (UIApplication.shared.delegate as! AppDelegate).lon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
