//
//  ViewController.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/12.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var laps: [String] = []
    var stopWatch: StopWatch?
    
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var lapsTableView: UITableView!
    @IBOutlet weak var standbyButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBAction func startStop(sender: AnyObject) {
        if stopWatch?.standby == true {
            stopWatch?.active(standbyButton, recordButton: recordButton)
        } else {
            stopWatch?.passive(standbyButton, recordButton: recordButton)
        }
    }
    @IBAction func lapReset(sender: AnyObject) {
        if stopWatch!.addLap == true {
            dispatch_async(dispatch_get_main_queue(), {
                self.laps.insert(self.stopWatch!.time, atIndex: 0)
                self.lapsTableView.reloadData()
            })
        } else {
            stopWatch!.addLap = false
            laps.removeAll(keepCapacity: false)
            lapsTableView.reloadData()
            stopWatch?.reset()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch = StopWatch(label: stopwatchLabel)
        standbyButton.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.1, alpha: 1.0)
        standbyButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        standbyButton.layer.cornerRadius = 10
        
        recordButton.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.86, alpha: 1.0)
        recordButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        recordButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap \(laps.count - indexPath.row)"
        cell.detailTextLabel?.text = "\(laps[indexPath.row])"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count        
    }
}

