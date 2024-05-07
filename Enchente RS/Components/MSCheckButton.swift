//
//  MSCheckButton.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

public struct MSCheckButton: View {

    @Binding private var isSelected: Bool
    private let text: String?

    // MARK: - Inits
    public init(
        _ isSelected: Binding<Bool>,
        text: String? = nil
    ) {
        self.text = text
        self._isSelected = isSelected
    }

    public var body: some View {
        DynamicButton($isSelected) {
            let isSelected = $0 || isSelected

            HStack(spacing: 10) {
                Group {
                    if isSelected {
                        Image(.checkbox)
                            .resizable()
                            .scaledToFit()
                            .padding(.all, -2)
                            .foregroundColor(._700)
                    } else {
                        Rectangle()
                            .fill(.clear)
                    }
                }
                .frame(width: 24, height: 24)
                .background(Color.white)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius:4)
                        .stroke(._700, lineWidth: 2)
                )

                if let text = text {
                    Text(text)
                        .foregroundColor(.black)
                        .font(.caption)
                }
            }
        }
    }
}

// MARK: - Preview

struct MSCheckButton_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            MSCheckButton(
                .constant(true),
                text: "Hello World!"
            )
            .padding()

            MSCheckButton(
                .constant(false),
                text: "Hello World!"
            )
            .padding()
        }
    }
}
