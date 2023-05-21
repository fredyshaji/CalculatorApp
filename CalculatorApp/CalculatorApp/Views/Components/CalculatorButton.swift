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

        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
                .buttonStyle(CalculatorButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: getBackgroundColor(),
                    foregroundColor: getForegroundColor(),
                    isWide: buttonType == .digit(.zero) || buttonType == .bitcoin)
                )
        }

        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }

        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ?
            buttonType.foregroundColor : buttonType.backgroundColor
        }

        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
        }
    }
}

struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(buttonType: .digit(.five))
            .environmentObject(CalculatorView.CalculatorViewModel())
    }
}
