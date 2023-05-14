//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import Foundation
import Combine

extension CalculatorView {
    final class CalculatorViewModel: ObservableObject {
        
        // MARK: - PROPERTIES
        
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            [[.allClear, .negative, .percent, .operation(.division)],
             [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
             [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
             [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
             [.digit(.zero), .decimal, .equals],
             [.bitcoin, .sin, .cos]]
        }
        
        // MARK: - ACTIONS
        
        func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            case .cos:
                calculator.setCosOperation()
            case .sin:
                calculator.setSinOperation()
            case .bitcoin:
                calculator.setBitcoinOperation()
            }
        }
    }
}
