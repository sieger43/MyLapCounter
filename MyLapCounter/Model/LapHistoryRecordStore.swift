//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class LapHistoryRecordStore {
    
    var allItems: [LapHistoryRecord] = []
    
    init() {
        for ii in 0..<5 {
            createItem(index: ii)
        }
    }
    
    @discardableResult func createItem(index: Int) -> LapHistoryRecord {
        let newItem = LapHistoryRecord(my_index: index)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
