//
//  Digits.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
