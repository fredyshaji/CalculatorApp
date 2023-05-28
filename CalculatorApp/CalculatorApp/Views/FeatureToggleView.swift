//
//  FeatureToggleView.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-28.
//

import SwiftUI

struct FeatureToggleView: View {
    @EnvironmentObject private var viewModel: FeatureToggleViewModel

    @Binding var multiSelection: Set<ButtonType>
    @State private var isEditMode: EditMode = .active

//    init() {
//        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(selection: $multiSelection) {
                    ForEach(viewModel.features) { feature in
                        FeatureRow(feature: feature, selectedItems: $multiSelection)
                    }
                }
//                .environment(\.editMode, $isEditMode)
            }
            .navigationTitle("Select Features To Remove")
            .toolbar {
                
            }
        }
    }
}

struct FeatureToggleView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureToggleView(multiSelection: .constant([.bitcoin]))
            .environmentObject(FeatureToggleView.FeatureToggleViewModel())
    }
}
