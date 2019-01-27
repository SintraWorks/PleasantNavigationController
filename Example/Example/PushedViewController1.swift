//
//  PushedViewcontroller.swift
//  Example
//
//  Created by Antonio Nunes on 16/01/2019.
//  Copyright © 2019 SintraWorks. All rights reserved.
//

import UIKit

class PushedViewController1: UIViewController {}

extension PushedViewController1 {
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
