//
//  MSTabBar.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI

struct MSTabBarItem {

    fileprivate let id = UUID()
    let image: Image
    let title: Text
}

struct MSTabBar: View {

    @Binding var selection: Int
    let items: [MSTabBarItem]

    init(selection: Binding<Int>, items: [MSTabBarItem]) {
        self._selection = selection
        self.items = items
    }

    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(items.enumerated()), id: \.element.id) { offset, item in
                Button {
                    selection = offset
                } label: {
                    VStack(spacing: 4) {
                        ZStack {
                            if offset == selection {
                                Capsule()
                                    .fill(Color.CaribbeanGreen._950)
                                    .frame(width: 64)
                            }

                            item.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(offset == selection ? Color.CaribbeanGreen._50 : Color.ColorNeutral.neutral)
                        }
                        .frame(height: 32)

                        item.title
                            .font(.caption.weight(offset == selection ? .bold : .medium))
                            .lineLimit(2)
                            .frame(height: 32, alignment: .top)
                            .foregroundColor(offset == selection ? .tabViewTint : Color.ColorNeutral.neutral)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(height: 80)
        .background(Color.CaribbeanGreen._50.ignoresSafeArea())
    }
}
