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

    @IBOutlet var tableView: UITableView!

    var lapCounterRecords: [LapHistoryEntity] = []
    
    func refreshLapHistoryTable() {

        let fetchRequest:NSFetchRequest<LapHistoryEntity> = LapHistoryEntity.fetchRequest();
        if let result = try? dataController.viewContext.fetch(fetchRequest) {
            lapCounterRecords = result
        }
        self.tableView.reloadData()
    }

    @IBAction func clearButtonAction(_ sender: Any) {
        
        // https://stackoverflow.com/questions/25511945/swift-alert-view-with-ok-and-cancel-which-button-tapped

        let refreshAlert = UIAlertController(title: "Clear Lap History", message: "All data will be lost.",
                                             preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LapHistoryEntity")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try self.dataController.viewContext.execute(batchDeleteRequest)
                try self.dataController.viewContext.save()
            } catch {
                // Error Handling
            }
            
            self.refreshLapHistoryTable()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            // do nothing for cancel
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
