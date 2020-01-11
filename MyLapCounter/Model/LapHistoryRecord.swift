//
//  LapHistoryRecord.swift
//  LapHistoryRecord
//
//  Created by John Berndt on 1/4/20.
//  Copyright © 2020 John Berndt. All rights reserved.
//

import Foundation

class LapHistoryRecord {
    
    var lapTime: String
    let dateCreated: Date
    
    init(lapUILabelValue: String) {
        
        self.lapTime = lapUILabelValue
        self.dateCreated = Date()
    }
}
