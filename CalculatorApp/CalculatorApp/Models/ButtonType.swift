//
//  ButtonType.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import Foundation

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
}
