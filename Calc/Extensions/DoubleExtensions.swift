//
//  DoubleExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/02.
//

import Foundation

extension Double {
    internal func isInt() -> Bool {
        abs(self.truncatingRemainder(dividingBy: 1)).isLess(than: .ulpOfOne)
    }
}
