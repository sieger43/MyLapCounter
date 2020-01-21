//
//  TimeDateUtils.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/20/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import Foundation
import UIKit

class TimeDateUtils {

    static func lapTime(lapTimeToDisplay : Date) -> String? {
        let time = Date().timeIntervalSince(lapTimeToDisplay)
        
        // Formatting snippit is from
        // https://stackoverflow.com/questions/35215694/format-timer-label-to-hoursminutesseconds-in-swift/35215847
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [ .hour, .minute, .second ] // Units to display in the formatted string
        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        
        return formatter.string(from: time)
    }
    
    static func timeDate(dateTimeToDisplay : Date) -> String? {
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatterPrint.string(from: dateTimeToDisplay)
    }
}
