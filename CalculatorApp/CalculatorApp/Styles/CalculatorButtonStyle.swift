//
//  ButtonStyle.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var height: CGFloat
    var width: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.system(size: 28, weight: .medium))
                .frame(width: width, height: height)
                .frame(maxWidth: isWide ? .infinity : width, alignment: .leading)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.2)
                    }
                }
                .clipShape(Capsule())
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.six)
    
    static var previews: some View {
        Button(buttonType.description) { }
            .buttonStyle(CalculatorButtonStyle(
                height: 80,
                width: 80,
                backgroundColor: .gray,
                foregroundColor: .white)
            )
    }
}
