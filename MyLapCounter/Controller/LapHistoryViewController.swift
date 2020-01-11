//
//  LapHistoryViewController.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/2/2020.
//  Copyright © 2020 John Berndt. All rights reserved.
//
import UIKit
import CoreData

class LapHistoryViewController: UIViewController {
    
    var dataController:DataController!

    var lapCounterRecords: [LapHistoryEntity] = []
    
    func refreshLapHistoryTable() {
        
        let fetchRequest:NSFetchRequest<LapHistoryEntity> = LapHistoryEntity.fetchRequest();
        if let result = try? dataController.viewContext.fetch(fetchRequest) {
            lapCounterRecords = result
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        
        refreshLapHistoryTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LapHistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapCounterRecords.count
    }
    
    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = lapCounterRecords[indexPath.row]

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let cellDate = item.dateCreated, let cellLapTime = item.lapTime {
        
            let nowString = dateFormatterPrint.string(from: cellDate)

            cell.textLabel?.text = nowString

            cell.detailTextLabel?.text = cellLapTime
        }
        
        return cell
    }
}
