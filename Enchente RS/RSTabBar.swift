//
//  RSTabBar.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI

struct RSTabBarItem {

    fileprivate let id = UUID()
    let image: Image
    let title: Text
}

struct RSTabBar: View {

    @Binding var selection: Int
    let items: [RSTabBarItem]

    init(selection: Binding<Int>, items: [RSTabBarItem]) {
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
                                    .fill(.caribbeanGreen950)
                                    .frame(width: 64)
                            }

                            item.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(offset == selection ? .caribbeanGreen50 : .neutral)
                        }
                        .frame(height: 32)

                        item.title
                            .font(.caption.weight(offset == selection ? .bold : .medium))
                            .lineLimit(2)
                            .frame(height: 32, alignment: .top)
                            .foregroundColor(offset == selection ? .tabViewTint : .neutral)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(height: 80)
        .background(Color.caribbeanGreen50.ignoresSafeArea())
    }
}
