//
//  ContentView.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var formula = "0" {
        didSet {
            switch formula {
            case "00" : formula = "0"
            case "01" : formula = "1"
            case "02" : formula = "2"
            case "03" : formula = "3"
            case "04" : formula = "4"
            case "05" : formula = "5"
            case "06" : formula = "6"
            case "07" : formula = "7"
            case "08" : formula = "8"
            case "09" : formula = "9"
            default: break
            }
        }
    }
    @State private var estimate = ""
    
    let onClosed: () -> Void
    
    var body: some View {
        VStack(spacing: -1) {
            HStack {
                ZStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(255, 95, 88))
                    Image(systemName: "circle")
                        .foregroundColor(Color(223, 66, 62))
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
        .background(KeyEvent { char in
            switch char {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "+", "-", "*", "/"  : formula += char
            case "=", "\r", "\u{3}" : formula = calc(formula: formula)
            case "\u{7f}" : formula = "0"
            case "\u{1b}" : onClosed()
            default: break
            }
            
        })
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
        ContentView() {}
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
