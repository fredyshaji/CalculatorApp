//
//  ThemeManager.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-21.
//

import Foundation

enum ThemeManager {
    static func getTheme(theme: ThemeName) -> Theme {
        switch theme {
        case .dark :
            return DarkTheme()
        case .light:
            return LightTheme()
        }
    }
}
