//
//  DateExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/04.
//

import Foundation

fileprivate let formatter: DateFormatter = {
    let f = DateFormatter()
    return f
}()

extension Date {
    internal func toString(_ format: String) -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    internal var unixtime: Int { Int(self.timeIntervalSince1970) }
}
