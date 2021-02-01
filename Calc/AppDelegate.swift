//
//  AppDelegate.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/25.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private let statusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
    private let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.

        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "plus.slash.minus", accessibilityDescription: nil)
            button.action = #selector(onButtonClicked(_:))
        }
        
        popover.contentSize = NSSize(width: 200, height: 300)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView() {
            self.popover.performClose(nil)
        })
    }

    @objc private func onButtonClicked(_ sender: NSStatusBarButton) {
        guard let button = statusItem.button else { return }
        
        if popover.isShown {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            popover.contentViewController?.view.window?.becomeKey()
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

