//
//  AppColors.swift
//  Calc
//
//  Created by H5267 on 2021/02/27.
//

import SwiftUI

internal enum AppColor {
    case lightGray
    case gray
    case darkGray
    case orange

    internal var value: Color {
        switch self {
        case .lightGray: return Color(128, 128, 128)
        case .gray     : return Color(100, 100, 100)
        case .darkGray : return Color( 84,  84,  84)
        case .orange   : return Color(255, 159,  11)
        }
    }
}
