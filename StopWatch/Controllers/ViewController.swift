//
//  ViewController.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/12.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var stopWatch: StopWatch?
    var selectedText: String? //subViewに渡す文字列
    var subTitleText: String?
    
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
                self.stopWatch!.update()
                self.lapsTableView.reloadData()
            })
        } else {
            stopWatch!.reset()
            lapsTableView.reloadData()
        }
    }
    @IBAction func unwind(sender: UIStoryboardSegue) {
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
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap \(stopWatch!.records.count - indexPath.row)"
        cell.detailTextLabel?.text = "\(stopWatch!.records[indexPath.row].time)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stopWatch!.records.count
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //subViewControllerに渡す文字列をセット
        selectedText = stopWatch!.records[indexPath.row].time
        subTitleText = "LAP \(stopWatch!.records.count - indexPath.row)"
        
        //subViewControllerへ遷移するSegueを呼び出す
        performSegueWithIdentifier("showSubView", sender: AnyObject?())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSubView") {
            let subVC: SubViewController = (segue.destinationViewController as? SubViewController)!
            subVC.lap = selectedText
            subVC.subTitleText = subTitleText
        }
    }
}

