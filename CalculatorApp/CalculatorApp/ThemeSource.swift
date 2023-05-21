//
//  ThemeSource.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-21.
//

import SwiftUI

class ThemeSource: ObservableObject {
    @AppStorage("selectedTheme") var selectedThemeStorage = DarkTheme().themeName.description {
        didSet {
            updateTheme()
        }
    }

    @Published var selectedTheme: Theme = DarkTheme()

    init() {
        updateTheme()
    }

    func updateTheme() {
        if selectedThemeStorage == DarkTheme().themeName.description {
            selectedTheme = ThemeManager.getTheme(theme: .dark)
        } else {
            selectedTheme = ThemeManager.getTheme(theme: .light)
        }
    }
}
