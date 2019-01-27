//
//  PushedViewController2.swift
//  Example
//
//  Created by Antonio Nunes on 16/01/2019.
//  Copyright © 2019 SintraWorks. All rights reserved.
//

import UIKit
import PleasantNavigationController

class PushedViewController2: PushedViewController1 {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideGoodbye()
    }
}

extension PushedViewController2 {
    func showGoodbye() {
        imageView.image = UIImage(named: "WavingHand")
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.label.alpha = 0.0
            self?.imageView.alpha = 1.0
        }
    }
    
    func hideGoodbye() {
        self.label.alpha = 1.0
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.imageView.alpha = 0.0
        }
    }
}
