//
//  LightViewController.swift
//  SlugSense
//
//  Created by Douglas MacbookPro on 1/21/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabSelected = 3

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabSelected = 3
    }

}
