//
//  FeatureToggleViewModel.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-28.
//

import Foundation

extension FeatureToggleView {
    final class FeatureToggleViewModel: ObservableObject {
        let features = [
            Feature(type: .operation(.addition), name: "Addition"),
            Feature(type: .operation(.multiplication), name: "Multiplication"),
            Feature(type: .operation(.division), name: "Division"),
            Feature(type: .operation(.subtraction), name: "Subtraction"),
            Feature(type: .sin, name: "Sin"),
            Feature(type: .cos, name: "Cosine"),
            Feature(type: .bitcoin, name: "Bitcoin")
        ]

//        func createDisabledButtonsArray(from )
    }
}
