//
//  MSAccordion.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

public struct MSAccordion<Content: View>: View {

    // MARK: - Properties
    @Binding var isExpanded: Bool

    private let title: String
    private let content: Content

    // MARK: - Inits
    public init(
        title: String,
        isExpanded: Binding<Bool>,
        @ViewBuilder content: () -> Content

    ) {
        self.title = title
        self._isExpanded = isExpanded
        self.content = content()
    }

    // MARK: - Body
    public var body: some View {
        VStack(spacing: 8) {
            DynamicButton(action: {
                isExpanded.toggle()
            }) { _ in
                HStack(spacing: 16) {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    (
                        isExpanded ? Image(.chevronUp) :
                            Image(.chevronDown)
                    )
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                .frame(height: 48)
                .animation(nil)
            }

            if isExpanded {
                content
                    .padding(.horizontal, 16)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .animation(.easeInOut(duration: 0.15), value: isExpanded)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 16) {
        MSAccordion(
            title: "Teste",
            isExpanded: .constant(false)) {
                Text("teste")
            }

        MSAccordion(
            title: "Teste",
            isExpanded: .constant(true)) {
                VStack {
                    ScrollView {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac lectus placerat, accumsan tellus et, egestas mi. Fusce blandit felis ut ipsum rutrum efficitur eu et neque. Phasellus sit amet arcu porta, molestie ipsum sed, dignissim lectus. Sed rutrum consectetur augue, in sollicitudin ipsum feugiat a. Proin massa nunc, hendrerit in ante ac, aliquam convallis felis. Nulla efficitur odio in ultrices congue. Morbi aliquam, magna id porttitor ultrices, purus sem vestibulum sem, ut luctus elit libero sodales ipsum. Aliquam faucibus, erat quis rhoncus facilisis, lectus turpis egestas ipsum, id molestie est dui at dui. Pellentesque sollicitudin blandit bibendum. Proin libero neque, lacinia ac est in, tempor molestie libero. Integer sodales ex eu nulla congue, vel molestie ex iaculis. Integer sit amet ornare dui. Praesent in interdum ex.Sed ac massa dictum ipsum aliquam porta nec vitae purus. Nulla iaculis, dolor id feugiat efficitur, urna erat sodales metus, nec consectetur tortor augue quis sem. Vestibulum vitae arcu sapien. Aenean tristique fermentum lacus, consectetur volutpat nisi ultricies quis. Suspendisse dapibus, augue non facilisis bibendum, ante tortor consequat erat, quis elementum tortor lorem nec ipsum. Nulla ac nunc at nisl placerat pretium id id odio. Pellentesque dui lectus, feugiat eget mauris non, interdum porta nunc. Sed eget dictum lacus, ac consequat leo.")
                    }
                }
            }
    }
    .padding(16)
}


