//
//  ShelterDetailsView.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import SwiftUI

struct ShelterDetailsView: View {
    let shelter: Shelter

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(.donation)

                VStack(alignment: .leading) {
                    Text(shelter.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(shelter.address!)
                        .font(.subheadline)
                }
                Spacer()
            }

            Text("Estão precisando de:")
                .fontWeight(.semibold)

            Divider()
                .padding(.bottom, 16)

            Text(shelter.needsList ?? "")
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading: BackButton())
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 8) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.black)
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text("Detalhe do local")
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
        }
    }
}
