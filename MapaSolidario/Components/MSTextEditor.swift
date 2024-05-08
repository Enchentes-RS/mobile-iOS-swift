//
//  MSTextEditor.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

@MainActor
public struct MSTextEditor: View {

    // MARK: - Properties
    @Binding var text: String
    private let placeholder: String?

    // MARK: - Inits
    public init(
        _ placeholder: String? = nil,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self._text = text
    }

    public var body: some View {

        VStack(alignment: .leading, spacing: 4) {
            if let placeholder {
                Text(placeholder)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }

            TextEditor(text: $text)
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(6)
                .frame(height: 158)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: -0.5)
                        .stroke(Color(red: 0.41, green: 0.41, blue: 0.41), lineWidth: 1)
                )
                .zIndex(1)
        }
    }
}


// MARK: - Previews
#Preview {
    VStack(spacing: 12) {
        MSTextEditor(
            "Lorem Ipsum",
            text: .constant("")
        )
    }
    .padding()
}
