//
//  Theme.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-21.
//

import UIKit

protocol Theme {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var themeName: ThemeName { get }
    
    func getBackgroundColor(for buttonType: ButtonType) -> UIColor
    func getForegroundColor(for buttonType: ButtonType) -> UIColor
}


enum ThemeName: Hashable, CustomStringConvertible {
    case dark
    case light

    var description: String {
        switch self {
        case .dark:
            return "dark"
        case .light:
            return "light"
        }
    }
}
