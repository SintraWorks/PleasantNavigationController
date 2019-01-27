//
//  ViewController.swift
//  Example
//
//  Created by Antonio Nunes on 15/01/2019.
//  Copyright © 2019 SintraWorks. All rights reserved.
//

import UIKit
import PleasantNavigationController

class BaseViewController: UITableViewController {
    
    var poppedScreenName: String? {
        didSet {
            if let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) {
                cell.textLabel?.text = "Welcome back from screen \(poppedScreenName ?? "unknown")"
            }
        }
    }
}
