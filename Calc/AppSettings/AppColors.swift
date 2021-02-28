//
//  AppColors.swift
//  Calc
//
//  Created by H5267 on 2021/02/27.
//

import SwiftUI

internal enum AppColor {
    case white
    case whiteGray
    case lightGray
    case gray
    case darkGray
    case orange

    internal var value: Color {
        switch self {
        case .white    : return Color(255, 255, 255)
        case .whiteGray: return Color(160, 160, 160)
        case .lightGray: return Color(105, 105, 105)
        case .gray     : return Color( 76,  76,  76)
        case .darkGray : return Color( 56,  56,  56)
        case .orange   : return Color(255, 159,  11)
        }
    }
}
