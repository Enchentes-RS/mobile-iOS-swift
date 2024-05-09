//
//  MSInput.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

@MainActor
public struct MSInput: View {

    // MARK: - Properties
    @Binding var text: String
    private let placeholder: String?
    private let title: String?

    // MARK: - Inits
    public init(
        title: String? = nil,
        placeholder: String? = nil,
        text: Binding<String>
    ) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)

            }

            TextField(placeholder ?? "", text: $text)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: -0.5)
                        .stroke(Color(red: 0.41, green: 0.41, blue: 0.41), lineWidth: 1)

                )
        }
        .frame(height: 62)
    }
}

// MARK: - Previews
#Preview {
    VStack(spacing: 12) {
        MSInput(
            title: "Lorem Ipsum",
            text: .constant("")
        )
    }
    .padding()
}
