//
//  ViewController.swift
//  PomoDomo
//
//  Created by Danielle Golinsky on 12/27/18.
//  Copyright © 2018 Danielle Golinsky. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var slider: NSSliderCell!
    @IBOutlet weak var sliderLabel: NSTextField!
    
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.intValue = appDelegate.interval
        sliderLabel.stringValue = slider.stringValue
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderLabel.stringValue = slider.stringValue
        appDelegate.interval = slider.intValue
    }
}

