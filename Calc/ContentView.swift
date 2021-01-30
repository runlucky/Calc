//
//  ContentView.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("0")
            HStack {
                Button("AC") {}
                Button(systemName: "arrow.left") {}
                Button("") {}
                Button("") {}
            }
            HStack {
                Button("7") {}
                Button("8") {}
                Button("9") {}
                Button(systemName: "divide") {}
            }

            HStack {
                Button("4") {}
                Button("5") {}
                Button("6") {}
                Button(systemName: "multiply") {}
            }

            HStack {
                Button("1") {}
                Button("2") {}
                Button("3") {}
                Button(systemName: "minus") {}
            }

            HStack {
                Button("0") {}
                Button(".") {}
                Button(systemName: "equal") {}
                Button(systemName: "plus") {}
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 320, height: 480))
    }
}
