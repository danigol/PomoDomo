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
    public var timeLeft: Int32 = 0
    
    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    
    let notification = NSUserNotification()
    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusItem = NSStatusBar.system.statusItem(withLength: -1)
        self.statusItem?.button?.title = "PomoDomo!"
        self.statusItem?.button?.image = NSImage(named:NSImage.Name("PomoDomo_ic64.png"))
        self.statusItem!.menu = self.menu
        
        startTimerMenuItem.isHidden = false
        stopTimerMenuItem.isHidden = true
        resetTimerMenuItem.isHidden = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func startTimer(_ sender: Any) {
        // TODO Temporarily just making it set and forget. But will have to return to this
//        startTimerMenuItem.isHidden = true
//        stopTimerMenuItem.isHidden = false
//        resetTimerMenuItem.isHidden = false
        
        if timeLeft == 0 {
            timeLeft = interval
        }
        
        // TODO Start an actual timer.
        showTimesUpNotification(title: "Timer Finished!",
                                subTitle: "Time to take a break!",
                                deliveryDate: Date(timeIntervalSinceNow: TimeInterval(timeLeft * 60)))
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        startTimerMenuItem.isHidden = false
        stopTimerMenuItem.isHidden = true
        resetTimerMenuItem.isHidden = true
        
        let intervalLeft = notification.deliveryDate?.timeIntervalSinceNow
        timeLeft = Int32(intervalLeft!)
        
        NSUserNotificationCenter.cancelPreviousPerformRequests(withTarget: notification)
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        startTimerMenuItem.isHidden = false
        stopTimerMenuItem.isHidden = true
        resetTimerMenuItem.isHidden = true
        
        // TODO Stops the timer & Resets
        timeLeft = interval
    }
    
    func showTimesUpNotification(title: String, subTitle: String, deliveryDate: Date) {
        notification.title = title
        notification.subtitle = subTitle
        notification.soundName = "Purr"
        
        notification.deliveryDate = deliveryDate
        NSUserNotificationCenter.default.scheduleNotification(notification)
    }
    
}

