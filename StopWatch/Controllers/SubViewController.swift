//
//  SubViewController.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/16.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    var lap: String?
    var subTitleText: String?
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var lapText: UILabel!
    @IBAction func backButton(sender: AnyObject?) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lapText.text = lap
        subTitle.text = subTitleText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
