//
//  ButtonType.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
    case sin
    case cos
    case bitcoin

    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "±"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        case .sin:
            return "sin"
        case .cos:
            return "cos"
        case .bitcoin:
            return "₿"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return Color(.lightGray)
        case .operation, .equals, .sin, .cos, .bitcoin:
            return .orange
        case .digit, .decimal:
            return .secondary
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
}
