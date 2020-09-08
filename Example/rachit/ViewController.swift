//
//  ViewController.swift
//  rachit
//
//  Created by RachitKhattar on 09/08/2020.
//  Copyright (c) 2020 RachitKhattar. All rights reserved.
//

import UIKit
import rachit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array Extension Test Code
        var firstArr = [1, 2, 3]
        let secondArr = [1, 2]
        
        firstArr.containsSameElements(as: secondArr)
        
        firstArr.appendIfNotContains(10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

