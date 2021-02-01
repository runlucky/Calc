//
//  keyevent.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/01.
//

import SwiftUI

struct KeyEvent: NSViewRepresentable {
    class KeyView: NSView {
        override var acceptsFirstResponder: Bool { true }
        override func keyDown(with event: NSEvent) {
//            super.keyDown(with: event)
            print(">> key \(event.charactersIgnoringModifiers ?? "")")
        }
    }

    func makeNSView(context: Context) -> NSView {
      let view = KeyView()
      DispatchQueue.main.async {
        view.window?.makeFirstResponder(view)
      }
      return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}
