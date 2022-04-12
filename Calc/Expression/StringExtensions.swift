//
//  StringExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/02.
//

import Foundation

extension String {
    internal func evaluate() -> String {
        guard let result = try? Expression(self).evaluate() else { return "Error" }
        
        if result.isInt() {
            return Int(exactly: result)?.description ?? "NaN"
        }
        return result.description
    }
    
    internal var isExpression: Bool {
        (try? Expression(self).evaluate()) != nil
    }
}
