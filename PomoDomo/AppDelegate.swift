//
//  AppDelegate.swift
//  PomoDomo
//
//  Created by Danielle Golinsky on 12/27/18.
//  Copyright © 2018 Danielle Golinsky. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menu: NSMenu!
    public var interval: Int32 = 20
    
    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusItem = NSStatusBar.system.statusItem(withLength: -1)
        self.statusItem?.button?.title = "PomoDomo!"
        self.statusItem?.button?.image = NSImage(named:NSImage.Name("PomoDomo_ic64.png"))
        self.statusItem!.menu = self.menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

