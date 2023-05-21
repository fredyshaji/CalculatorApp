//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Fredy Shaji on 2023-05-14.
//

import SwiftUI

// MARK: - BODY

struct CalculatorView: View {

    @EnvironmentObject private var viewModel: CalculatorViewModel
    @EnvironmentObject private var themeSource: ThemeSource
    @State private var switchTheme = false

    var body: some View {
        VStack {
            Toggle("Switch Theme", isOn: $switchTheme)
                .onChange(of: switchTheme) { newValue in
                    if newValue {
                        themeSource.selectedThemeStorage = LightTheme().themeName.description
                    } else {
                        themeSource.selectedThemeStorage = DarkTheme().themeName.description
                    }
                }
                .foregroundColor(Color(themeSource.selectedTheme.secondaryColor))
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color(themeSource.selectedTheme.primaryColor))
    }
}

// MARK: - PREVIEWS

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.CalculatorViewModel())
            .environmentObject(ThemeSource())
    }
}

// MARK: - COMPONENTS

extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(Color(themeSource.selectedTheme.secondaryColor))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }

    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
