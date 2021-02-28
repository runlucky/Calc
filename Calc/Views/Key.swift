//
//  Key.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/31.
//

import SwiftUI

struct Key: View {
    private let color: AppColor
    private let base: BaseView
    private let action: () -> Void
    
    internal init(_ text: String, _ color: AppColor = .lightGray, action: @escaping () -> Void) {
        base = BaseView(text)
        self.color = color
        self.action = action
    }
    
    internal init(systemName: String, _ color: AppColor = .lightGray, action: @escaping () -> Void) {
        base = BaseView(systemName: systemName)
        self.color = color
        self.action = action
    }
    
    var body: some View {
        base.background(color.value)
            .onTapGesture {
                action()
            }
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
                .foregroundColor(AppColor.white.value)
                .frame(width: 50, height: 45)
                .border(AppColor.darkGray.value, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        } else {
            Image(systemName: value)
                .font(.title2)
                .foregroundColor(AppColor.white.value)
                .frame(width: 50, height: 45)
                .border(AppColor.darkGray.value, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
    
}
