//
//  Copyright © 2015 Big Nerd Ranch
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
