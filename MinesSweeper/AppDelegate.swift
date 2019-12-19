//
//  AppDelegate.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

//    @IBOutlet weak var window: NSWindow!
    var window: NSWindow!
    var windowController: NSWindowController!
    var mainViewController: MSMainViewController?;
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow()
        window.styleMask = NSWindow.StyleMask(rawValue: 0xf)
        window.backingType = .buffered
        mainViewController = MSMainViewController()
        window.contentViewController = mainViewController
        window.setFrameOrigin(MSMacro.windowOrigin)
        window.setContentSize(NSSize(width: 300, height: 60))
        window.styleMask.remove(.resizable)

        windowController = NSWindowController()
        windowController.contentViewController = window.contentViewController
        windowController.window = window

        windowController.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

