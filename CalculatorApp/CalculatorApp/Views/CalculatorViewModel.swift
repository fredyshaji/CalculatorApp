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

        var buttonTypesLandscape: [[ButtonType]] {
            [[.allClear, .negative, .percent, .decimal, .operation(.division)],
             [.digit(.five), .digit(.six), .digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
             [.digit(.zero), .digit(.one), .digit(.two), .digit(.three), .digit(.four), .operation(.subtraction)],
             [.sin, .cos, .bitcoin, .equals, .operation(.addition)]]
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
                CalculatorNetworkHandler().fetchBitcoinValue { [weak self] value, error in
                    guard let value, let self else { return }
                    self.calculator.setBitcoinOperation(value: value)
                }
            }
        }

        // MARK: - HELPERS
        
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else { return false}
            return calculator.operationIsHighlighted(operation)
        }
    }
}
