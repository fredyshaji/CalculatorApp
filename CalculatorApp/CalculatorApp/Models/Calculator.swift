//
//  Calculator.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import Foundation

struct Calculator {
    
    // MARK: - PROPERTIES
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
        }
    }

    private var expression: ArithmeticExpression?
    private var result: Decimal?
    private var carryingNegative: Bool = false
    
    // MARK: - COMPUTED PROPERTIES

    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    /// Current displaying number
    private var number: Decimal? {
        newNumber ?? expression?.number ?? result
    }
    
    // MARK: - OPERATIONS
    
    mutating func setDigit(_ digit: Digit) {
        guard canAddDigit(digit) else { return }

        let numberString = getNumberString(forNumber: newNumber)

        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var number = newNumber ?? result else { return }

        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }

        expression = ArithmeticExpression(number: number, operation: operation)

        newNumber = nil
    }

    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        if let number = result {
            result = -number
            return
        }
        if let number = expression?.number {
            expression?.number = -number
            return
        }

        carryingNegative.toggle()
    }

    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }

        if let number = result {
            result = number / 100
            return
        }
    }

    mutating func setDecimal() {
        
    }

    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }

        result = expressionToEvaluate.evaluate(with: number)

        expression = nil
        newNumber = nil
    }

    mutating func allClear() {
        
    }

    mutating func clear() {
        
    }

    mutating func setCosOperation() {
        if let number = number {
            let radianValue = number * (Decimal.pi / 180.0)
            let doubleValue = NSDecimalNumber(decimal: radianValue).doubleValue
            let sinValue = cos(doubleValue)
            result = Decimal(sinValue)

            expression = nil
            newNumber = nil
        }
    }

    mutating func setSinOperation() {
        if let number = number {
            let radianValue = number * (Decimal.pi / 180.0)
            let doubleValue = NSDecimalNumber(decimal: radianValue).doubleValue
            let sinValue = sin(doubleValue)
            result = Decimal(sinValue)

            expression = nil
            newNumber = nil
        }
    }

    mutating func setBitcoinOperation() {
        
    }

    // MARK: - HELPERS

    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"

        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }

        return numberString
    }
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }

    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtraction:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            }
        }
    }

    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }

}
