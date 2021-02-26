//
//  Key.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/31.
//

import SwiftUI

struct Key: View {
    private let color: BackgroundColor
    private let base: BaseView
    private let action: () -> Void
    
    internal init(_ text: String, _ color: BackgroundColor = .gray, action: @escaping () -> Void) {
        base = BaseView(text)
        self.color = color
        self.action = action
    }
    
    internal init(systemName: String, _ color: BackgroundColor = .gray, action: @escaping () -> Void) {
        base = BaseView(systemName: systemName)
        self.color = color
        self.action = action
    }
    
    var body: some View {
        switch color {
        case .gray:
            base.background(Color(140, 140, 140))
                .onTapGesture {
                    action()
                }

        case .orange:
            base.background(Color(254, 147, 39))
                .onTapGesture {
                    action()
                }
        }
    }
    
    internal enum BackgroundColor {
        case gray
        case orange
    }
}


private struct BaseView: View {
    private let value: String
    private let isText: Bool

    init(_ text: String) {
        value = text
        isText = true
    }
    
    init(systemName: String) {
        value = systemName
        isText = false
    }
    
    var body: some View {
        if isText {
            Text(value)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 50, height: 45)
                .border(Color(64, 64, 64), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        } else {
            Image(systemName: value)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 50, height: 45)
                .border(Color(64, 64, 64), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
    
}
