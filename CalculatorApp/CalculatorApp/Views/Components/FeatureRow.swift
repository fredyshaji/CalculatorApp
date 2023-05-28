//
//  FeatureRow.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-28.
//

import SwiftUI

struct FeatureRow: View {
    let feature: Feature
    @Binding var selectedItems: Set<ButtonType>

    var isSelected: Bool {
        selectedItems.contains(feature.type)
    }

    var body: some View {
        HStack {
            Text(feature.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            if isSelected {
                self.selectedItems.remove(feature.type)
            } else {
                self.selectedItems.insert(feature.type)
            }
        }
    }
}

struct FeatureRow_Previews: PreviewProvider {
    static var previews: some View {
        let feature = Feature(type: .bitcoin, name: "Bitcoin")
        FeatureRow(feature: feature, selectedItems: .constant([feature.type]))
    }
}
