//
//  keyevent.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/01.
//

import SwiftUI

struct KeyEvent: NSViewRepresentable {
    internal let onKeyDown: (String, NSEvent.ModifierFlags) -> Void
    
    class KeyView: NSView {
        fileprivate var onKeyDown: ((String, NSEvent.ModifierFlags) -> Void)?

        override var acceptsFirstResponder: Bool { true }
        override func keyDown(with event: NSEvent) {
            if let characters = event.characters {
                onKeyDown?(characters, event.modifierFlags)
            }
        }
    }

    func makeNSView(context: Context) -> NSView {
        let view = KeyView()
        view.onKeyDown = onKeyDown
        DispatchQueue.main.async {
            view.window?.makeFirstResponder(view)
        }
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}
