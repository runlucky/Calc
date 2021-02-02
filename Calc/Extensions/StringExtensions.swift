//
//  StringExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/02.
//

import Foundation

extension String {
    internal func evaluate() ->String {
        guard let result = try? Expression(self).evaluate() else { return "Error" }
        
        if result.isInt() {
            return Int(result).description
        }
        return result.description
    }
}


extension Double {
    internal func isInt() -> Bool {
        abs(self.truncatingRemainder(dividingBy: 1)).isLess(than: .ulpOfOne)
    }
}
