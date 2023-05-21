//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by Fredy Shaji on 2023-05-14.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.CalculatorViewModel())
                .environmentObject(ThemeSource())
        }
    }
}
