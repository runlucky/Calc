//
//  ContentView.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var formula = "0"
    @State private var estimate = ""
    
    var body: some View {
        VStack(spacing: -1) {
            HStack {
                ZStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(255, 95, 88))
                    Image(systemName: "circle")
                        .foregroundColor(Color(255, 65, 58))
                }
                .onTapGesture {
                    NSApplication.shared.terminate(self)
                }
                Spacer()
            }
            Text(formula)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color(100, 100, 100))

            HStack(spacing: -1) {
                Key("AC") { formula = "0" }
                Key(systemName: "arrow.left") {}
                Key("") {}
                Key("") {}
            }
            HStack(spacing: -1) {
                Key("7") { formula += "7" }
                Key("8") { formula += "8" }
                Key("9") { formula += "9" }
                Key(systemName: "divide") { formula += "/" }
            }

            HStack(spacing: -1) {
                Key("4") { formula += "4" }
                Key("5") { formula += "5" }
                Key("6") { formula += "6" }
                Key(systemName: "multiply") { formula += "*" }
            }

            HStack(spacing: -1) {
                Key("1") { formula += "1" }
                Key("2") { formula += "2" }
                Key("3") { formula += "3" }
                Key(systemName: "minus") { formula += "-" }
            }

            HStack(spacing: -1) {
                Key("0") { formula += "0" }
                Key(".") { formula += "." }
                Key(systemName: "equal") { formula = calc(formula: formula) }
                Key(systemName: "plus") { formula += "+" }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(KeyEvent())
    }
    
    private func calc(formula: String) -> String {
        if let result = NSExpression(format: formula).expressionValue(with: nil, context: nil) {
            return String(describing: result)
        }
        
        return "Error"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
