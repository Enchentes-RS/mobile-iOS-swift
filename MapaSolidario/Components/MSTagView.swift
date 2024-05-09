//
//  MSTagView.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import SwiftUI

struct MSTagView: View {
    let title: String
    let type: MSTagType

    init(_ title: String, _ type: MSTagType) {
        self.title = title
        self.type = type
    }

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(type.foreground)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(height: 32, alignment: .center)
        }
        .frame(alignment: .center)
        .background(type.background)
        .cornerRadius(8)
    }
}

extension MSTagView {
    enum MSTagType {
        case negative
        case positve

        var background: Color {
            switch self {
            case .negative:
                Color(red: 1, green: 0.83, blue: 0.8)
            case .positve:
                Color(.CaribbeanGreen._200)
            }
        }

        var foreground: Color {
            switch self {
            case .negative:
                Color(red: 0.79, green: 0.15, blue: 0.27)
            case .positve:
                Color(.CaribbeanGreen._950)
            }
        }
    }


}

#Preview {
    MSTagView("Teste", .negative)
}
