//
//  ViewController.swift
//  TableViewToUserDefaults
//
//  Created by Décio Luiz Gazzoni Filho on 27/01/19.
//  Copyright © 2019 Décio Luiz Gazzoni Filho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var sharedUserDefaultsController: NSUserDefaultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sharedUserDefaultsController.appliesImmediately = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

