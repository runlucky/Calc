//
//  Icon.swift
//  Calc
//
//  Created by 福田走 on 2021/02/01.
//

import SwiftUI

struct Icon: View {
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "circle")
                Image(systemName: "circle.fill")
            }
            HStack(spacing: 0) {
                Image(systemName: "circle")
                Image(systemName: "circle.fill")
            }
        }
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon()
    }
}
