//
//  Feature.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-28.
//

import Foundation

struct Feature: Identifiable, Hashable {
    let id: UUID = UUID()
    let type: ButtonType
    let name: String
}

//dummy

extension Feature {
    static func dummyData() -> [Feature] {
        [Feature(type: .operation(.addition), name: "Addition"),
        Feature(type: .operation(.multiplication), name: "Multiplication"),
        Feature(type: .operation(.division), name: "Division")]
    }
}
