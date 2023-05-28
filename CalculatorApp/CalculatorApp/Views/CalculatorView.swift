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
    @State var orientation = UIDevice.current.orientation
    @State var showModel = false
    @State var disabledFeatures = Set<ButtonType>()

    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .makeConnectable()
            .autoconnect()

    var body: some View {
        VStack {
            Button(action: {
                            showModel.toggle()
                        }, label: {
                            Text("Show filters")
                        }).sheet(isPresented: $showModel, content: {
                            FeatureToggleView(multiSelection: $disabledFeatures)
                                .environmentObject(FeatureToggleView.FeatureToggleViewModel())
                        })
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
        .onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
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
            let buttonTypes = orientation.isLandscape ? viewModel.buttonTypesLandscape : viewModel.buttonTypes
            let disabledButtons = Array(disabledFeatures)
            ForEach(buttonTypes, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonType in
                        if !disabledButtons.contains(buttonType) {
                            CalculatorButton(buttonType: buttonType, horizontalButtonCount: CGFloat(row.count), verticalButtonCount: CGFloat(buttonTypes.count))
                        }
                    }
                }
            }
        }
    }
}
