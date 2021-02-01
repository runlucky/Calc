//
//  Key.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/31.
//

import SwiftUI

struct Key: View {
    private let value: String
    private let isText: Bool
    private let action: () -> Void

    internal init(_ text: String, action: @escaping () -> Void) {
        value = text
        isText = true
        self.action = action
    }
    
    internal init(systemName: String, action: @escaping () -> Void) {
        value = systemName
        isText = false
        self.action = action
    }
    
    var body: some View {
        if isText {
            Text(value)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 50, height: 45)
                .background(Color(140, 140, 140))
                .border(Color(64, 64, 64), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    action()
                }
        } else {
            Image(systemName: value)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 50, height: 45)
                .background(Color(254, 147, 39))
                .border(Color(64, 64, 64), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    action()
                }
        }
    }
}

