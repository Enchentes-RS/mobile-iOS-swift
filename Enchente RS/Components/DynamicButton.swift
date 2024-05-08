//
//  SwiftUIView.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

public struct DynamicButton<Label: View>: View {

    private let label: (Bool) -> Label
    private let action: () -> Void

    public init(action: @escaping () -> Void, @ViewBuilder label: @escaping (Bool) -> Label) {
        self.label = label
        self.action = action
    }

    public init(_ isSelected: Binding<Bool>, @ViewBuilder label: @escaping (Bool) -> Label) {
        self.init(
            action: {
                isSelected.wrappedValue.toggle()
            },
            label: label
        )
    }

    public var body: some View {
        Button(action: action) {
            EmptyView()
        }
        .buttonStyle(DynamicButtonStyle(label))
    }
}

private extension DynamicButton {

    struct DynamicButtonStyle: ButtonStyle {

        private let label: (Bool) -> Label

        init(_ label: @escaping (Bool) -> Label) {
            self.label = label
        }

        func makeBody(configuration: Configuration) -> some View {
            label(configuration.isPressed)
                .contentShape(Rectangle())
        }
    }
}
