//
//  ViewExtensions.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/30.
//

import SwiftUI

extension Button where Label == Image {
    internal init(systemName: String, _ action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: systemName)
        }
    }
}
