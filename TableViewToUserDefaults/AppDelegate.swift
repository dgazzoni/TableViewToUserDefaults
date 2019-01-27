//
//  AppDelegate.swift
//  TableViewToUserDefaults
//
//  Created by Décio Luiz Gazzoni Filho on 27/01/19.
//  Copyright © 2019 Décio Luiz Gazzoni Filho. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var timer: Timer!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(printPresets), userInfo: nil, repeats: true)
    }

    @objc func printPresets() {
        NSLog("presets = \(Settings.sharedInstance.presets)")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

