//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class LapHistoryRecord {
    
    var name: String
    let dateCreated: Date
    
    init(name: String) {
        self.name = name
        self.dateCreated = Date()
    }
    
    convenience init(my_index: Int) {


        let lapName = "00:00:0\(my_index)"

        self.init(name: lapName)
    }
    
}
