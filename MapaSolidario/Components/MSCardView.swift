//
//  CardView.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import SwiftUI

struct MSCardView: View {
    let itemSelected: Shelter
    let close: ()->Void

    init(itemSelected: Shelter, close: @escaping () -> Void) {
        self.itemSelected = itemSelected
        self.close = close
    }

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack {
                Spacer()
                Image(.close)
                    .onTapGesture {
                        close()
                    }
            }

            HStack(alignment: .top) {
                Image(.donation)
                VStack(alignment: .leading) {
                    Text(itemSelected.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(itemSelected.address!)
                        .font(.subheadline)

                    HStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Doações")
                                .font(.caption)
                            MSTagView(
                                itemSelected.donations == .receiving
                                ? "Aceitando" : "Não Aceitando",
                                itemSelected.donations == .receiving
                                ? .positve : .negative)
                        }

                        VStack {
                            Text("Voluntários")
                                .font(.caption)
                            MSTagView(
                                itemSelected.volunteers == .receiving
                                ? "Aceitando" : "Não Aceitando",
                                itemSelected.donations == .receiving
                                ? .positve : .negative)
                        }
                    }
                    .padding(.top, 16)
                }
                Spacer()
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 8)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.5)
                .stroke(Color(red: 0.9, green: 0.91, blue: 0.92), lineWidth: 1)
        )
    }
}

#Preview {
    VStack {
//        MSCardView()
    }
    .padding(16)
}
