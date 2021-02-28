//
//  CloseView.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/02/02.
//

import SwiftUI

struct CloseView: View {
    @State private var hovering = false
    
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .font(Font.body.weight(.ultraLight))
                .foregroundColor(Color(255, 95, 88))
            Image(systemName: "circle")
                .font(Font.body.weight(.ultraLight))
                .foregroundColor(Color(223, 66, 62))
            if hovering {
                Image(systemName: "multiply")
                    .font(.caption)
                    .foregroundColor(Color(157, 2, 3))
            }
        }
        .onHover { hovering in
            self.hovering = hovering
        }
        .onTapGesture {
            NSApplication.shared.terminate(self)
        }
    }
}

struct CloseView_Previews: PreviewProvider {
    static var previews: some View {
        CloseView()
    }
}
