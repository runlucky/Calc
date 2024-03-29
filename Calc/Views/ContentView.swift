//
//  ContentView.swift
//  Calc
//
//  Created by Kakeru Fukuda on 2021/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var preview: String = ""
    @State private var formula = "0" {
        didSet {
            switch formula {
            case "00", "" : formula = "0"
            case "01" : formula = "1"
            case "02" : formula = "2"
            case "03" : formula = "3"
            case "04" : formula = "4"
            case "05" : formula = "5"
            case "06" : formula = "6"
            case "07" : formula = "7"
            case "08" : formula = "8"
            case "09" : formula = "9"
            case "0(" : formula = "("
            default: break
            }
            
            estimate = formula.evaluate()
        }
    }
    @State private var estimate = "" {
        didSet {
            if estimate == formula { estimate = "" }
            if estimate == "Error" { estimate = oldValue }
        }
    }
    
    var body: some View {
        VStack(spacing: -1) {
            HStack(spacing: 0) {
                CloseView()
                    .padding(.leading, 3)
                Spacer()
                Text(preview)
                    .font(.body)
                    .foregroundColor(AppColor.whiteGray.value)
                    .frame(width: 160, height: 20, alignment: .trailing)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)

            }
            .background(AppColor.darkGray.value)

            HStack(spacing: 0) {
                Text(formula)
                    .font(.title)
                    .foregroundColor(AppColor.white.value)
                    .frame(width: 130, height: 40, alignment: .trailing)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
                
                Text(estimate == "" ? "" : "=")
                    .font(.title2)
                    .foregroundColor(AppColor.whiteGray.value)
                    .frame(width: 15, height: 40, alignment: .center)
                    .minimumScaleFactor(0.5)

                Text(estimate)
                    .font(.title2)
                    .foregroundColor(AppColor.whiteGray.value)
                    .frame(width: 52, height: 40, alignment: .trailing)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)

            }
            .background(AppColor.darkGray.value)

            HStack(spacing: -1) {
                Key("AC", .gray) { formula = "0" }
                Key(systemName: "arrow.left", .gray) { formula = String(formula.dropLast()) }
                Key("UNIX\nTIME", .gray) {
                    if let unixtime = Double(formula) {
                        formula = Date(timeIntervalSince1970: unixtime).toString("yyyy/MM/dd HH:mm:ss") + "(JST)"
                    }
                    
                }
                Key("", .gray) {}
            }
            HStack(spacing: -1) {
                Key("7") { formula += "7" }
                Key("8") { formula += "8" }
                Key("9") { formula += "9" }
                Key(systemName: "divide", .orange) { formula += "/" }
            }

            HStack(spacing: -1) {
                Key("4") { formula += "4" }
                Key("5") { formula += "5" }
                Key("6") { formula += "6" }
                Key(systemName: "multiply", .orange) { formula += "*" }
            }

            HStack(spacing: -1) {
                Key("1") { formula += "1" }
                Key("2") { formula += "2" }
                Key("3") { formula += "3" }
                Key(systemName: "minus", .orange) { formula += "-" }
            }

            HStack(spacing: -1) {
                Key("0") { formula += "0" }
                Key(".") { formula += "." }
                Key(systemName: "equal") {
                    preview = formula + "= " + estimate
                    formula = formula.evaluate()
                }
                Key(systemName: "plus", .orange) { formula += "+" }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(KeyEvent { char, modifier in
            switch char {
            case "c" where modifier.contains(.command):
                let value: String = {
                    if estimate != "" { return estimate }
                    return formula
                }()
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(value, forType: .string)

            case "v" where modifier.contains(.command):
                if let value = NSPasteboard.general.string(forType: .string),
                   value.isExpression {
                    formula = value
                }
                
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "+", "-", "*", "/", "(", ")"  : formula += char
            case "=", "\r", "\u{3}" :
                preview = formula + "= " + estimate
                formula = formula.evaluate()

            case "\u{7f}" : formula = String(formula.dropLast())
            case "\u{1b}" : formula = "0"
            default: break
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 197, height: 285))
    }
}
