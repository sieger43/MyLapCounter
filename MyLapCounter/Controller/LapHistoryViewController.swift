//
//  LapHistoryViewController.swift
//  MyLapCounter
//
//  Created by John Berndt on 1/2/2020.
//  Copyright © 2020 John Berndt. All rights reserved.
//
import UIKit

class LapHistoryViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool)
    {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LapHistoryViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyLapCounterModel.allItems.count
    }
    
    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = MyLapCounterModel.allItems[indexPath.row]
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let nowString = dateFormatterPrint.string(from: item.dateCreated)
        
        cell.textLabel?.text = nowString
        
        cell.detailTextLabel?.text = item.lapTime

        return cell
    }
}
