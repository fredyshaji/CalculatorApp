//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-14.
//

import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {

        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: CalculatorViewModel
        @EnvironmentObject private var themeSource: ThemeSource

        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
                .buttonStyle(CalculatorButtonStyle(
                    height: UIDevice.current.orientation.isLandscape ? getButtonHeight() : getButtonWidth(),
                    width: getButtonWidth(),
                    backgroundColor: Color(themeSource.selectedTheme.getBackgroundColor(for: buttonType)),
                    foregroundColor: Color(themeSource.selectedTheme.getForegroundColor(for: buttonType)),
                    isWide: true)
                )
        }

        private func getButtonWidth() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = UIDevice.current.orientation.isLandscape ? 6.0 : 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }

        private func getButtonHeight() -> CGFloat {
            let screenHeight = UIScreen.main.bounds.height
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            let availableHeight = screenHeight - 130
            return (availableHeight - (spacingCount * Constants.padding)) / buttonCount
        }

        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ?
            Color(themeSource.selectedTheme.getForegroundColor(for: buttonType)) :
            Color(themeSource.selectedTheme.getBackgroundColor(for: buttonType))
        }

        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ?
            Color(themeSource.selectedTheme.getBackgroundColor(for: buttonType)) :
            Color(themeSource.selectedTheme.getForegroundColor(for: buttonType))
        }
    }
}

struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(buttonType: .digit(.five))
            .environmentObject(CalculatorView.CalculatorViewModel())
            .environmentObject(ThemeSource())
    }
}
