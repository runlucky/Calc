//
//  ColorExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/31.
//

import SwiftUI


extension Color {
    internal init(_ r: Int, _ g : Int, _ b: Int) {
        self = Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
