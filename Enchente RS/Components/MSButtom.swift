//
//  MSButtom.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

public struct MSButton: View {
    private let title: String
    private let action: () -> Void
    private let type: MSButtonType

    // MARK: - Life Cycle
    init(
        _ title: String,
        type: MSButtonType = .primary,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.type = type
        self.action = action
    }

    public var body: some View {
        DynamicButton(action: action) {_ in
            Text(title)
                .font(.headline)
                .foregroundColor(type.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(type.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

enum MSButtonType {
    case primary
    case disable

    var backgroundColor: Color {
        switch self {
        case .primary:
                ._800
        case .disable:
                .gray.opacity(0.3)
        }
    }

    var accentColor: Color {
        switch self {
        case .primary:
                .white
        case .disable:
                .black.opacity(0.7)
        }
    }
}

// MARK: - Preview
struct MSButton_Previews: PreviewProvider {
    static var previews: some View {
        let previewIsEnabled = true

        VStack(spacing: 16) {
            MSButton("Enviar") {}

            MSButton("Enviar",
                     type: .disable) {}
        }
        .padding()
    }
}
