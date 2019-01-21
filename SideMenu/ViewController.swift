//
//  ViewController.swift
//  SideMenu
//
//  Created by YC on 2019/1/9.
//  Copyright © 2019 YC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sidemenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainviewConstraint: NSLayoutConstraint!
//    @IBOutlet weak var sidemenuVC: UIView!
        var sidemenuwidth : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(presentSideMenu), name: NSNotification.Name("presentSideMenu"), object: nil)
        sidemenuwidth = sidemenuConstraint.constant
    }

    @objc func presentSideMenu() {
        if sidemenuConstraint.constant < 0 {
            sidemenuConstraint.constant = 0
            mainviewConstraint.constant = sidemenuwidth
        } else {
            sidemenuConstraint.constant = sidemenuwidth
            mainviewConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

