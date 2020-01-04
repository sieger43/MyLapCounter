//
//  TimerViewController.swift
//  MyLapCounter
//
//  Created by John Berndt on 12/26/19.
//  Copyright © 2019 John Berndt. All rights reserved.
//
import UIKit

class TimerViewController: UIViewController {
    
    var timer: Timer?
    var creationDate = Date()
    
    @IBAction func buttonAction(_ sender: Any) {
        
        if buttonLabel.titleLabel?.text == "Start" {
            creationDate = Date()
            createTimer()
            buttonLabel.setTitle("Stop",for: .normal)
        } else if buttonLabel.titleLabel?.text == "Stop" {
            cancelTimer()
            buttonLabel.setTitle("Start",for: .normal)
        }
    }
    
    @IBAction func lapButtonAction(_ sender: Any) {
        
        if let timerUI = timerLabel, let timerUIstring = timerUI.text {
            
            let newItem = LapHistoryRecord(lapUILabelValue: timerUIstring)
            
            MyLapCounterModel.allItems.append(newItem)
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension TimerViewController {
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        
        let time = Date().timeIntervalSince(creationDate)

        // Formatting snippit is from
        // https://stackoverflow.com/questions/35215694/format-timer-label-to-hoursminutesseconds-in-swift/35215847
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [ .hour, .minute, .second ] // Units to display in the formatted string
        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        
        timerLabel.text  = formatter.string(from: time)
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
}
