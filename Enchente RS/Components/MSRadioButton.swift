//
//  MSRadioButton.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 07/05/24.
//

import SwiftUI

public struct MSRadioButton: View {
    
    @Binding var isSelected: Bool
    private let text: String
    
    // MARK: - Life Cycle
    
    public init(
        _ text: String = "",
        isSelected: Binding<Bool>
    ) {
        self.text = text
        self._isSelected = isSelected
    }
    
    public var body: some View {
        DynamicButton($isSelected) {
            let isSelected = $0 || isSelected
            
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .animation(.easeInOut(duration: 0.15), value: isSelected)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.CaribbeanGreen._700)
                            .padding(.all, 4)
                            .transition(
                                .scale(scale: .zero)
                                .animation(.easeInOut(duration: 0.15))
                            )
                    }
                }
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .strokeBorder(
                            Color.CaribbeanGreen._700,
                            lineWidth: 2
                        )
                )
                
                if !text.isEmpty {
                    Text(text)
                        .foregroundColor(.black)
                        .font(.caption)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    VStack {
        MSRadioButton(
            "Hello World",
            isSelected: .constant(false)
        )
        .padding()
        
        MSRadioButton(
            "Hello World",
            isSelected: .constant(true)
        )
        .padding()
    }
}

