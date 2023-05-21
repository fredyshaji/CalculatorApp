//
//  ThemeDefinitions.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-21.
//

import UIKit

struct LightTheme: Theme {
    var themeName: ThemeName = .light
    
    var primaryColor: UIColor = .white
    
    var secondaryColor: UIColor = .black
    
    func getBackgroundColor(for buttonType: ButtonType) -> UIColor {
        switch buttonType {
        case .allClear, .clear, .negative, .percent:
            return .gray
        case .operation, .equals, .sin, .cos, .bitcoin:
            return .orange
        case .digit, .decimal:
            return .lightGray
        }
    }
    
    func getForegroundColor(for buttonType: ButtonType) -> UIColor {
        switch buttonType {
        case .allClear, .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
    
    
}

struct DarkTheme: Theme {
    var themeName: ThemeName = .dark
    
    var primaryColor: UIColor = .black
    
    var secondaryColor: UIColor = .white
    
    func getBackgroundColor(for buttonType: ButtonType) -> UIColor {
        switch buttonType {
        case .allClear, .clear, .negative, .percent:
            return .gray
        case .operation, .equals, .sin, .cos, .bitcoin:
            return .orange
        case .digit, .decimal:
            return .lightGray
        }
    }
    
    func getForegroundColor(for buttonType: ButtonType) -> UIColor {
        switch buttonType {
        case .allClear, .clear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
    
    
}
