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

    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

// MARK: - PREVIEWS

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

// MARK: - COMPONENTS

extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
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
