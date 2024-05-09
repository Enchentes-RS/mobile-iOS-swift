//
//  MenuViewController.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI

struct SignupView: View {
    @State var localName = ""
    @State var cep = ""
    @State var cnpj = ""
    @State var placeType: PlaceType = .donations

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Cadastro de Locais")
                        .font(.title)
                    .fontWeight(.bold)

                Text("Especifique abaixo o tipo do seu local")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("* Indica pergunta obrigatória")
                    .font(.caption)
                    .foregroundColor(.red)
                }
                .padding(.bottom, 32)

                VStack(spacing: 24) {
                    MSInput(
                        title: "Nome do Local",
                        placeholder: "Digite o nome do local",
                        text: $localName
                    )

                    MSInput(
                        title: "CEP",
                        placeholder: "Digite o CEP do local",
                        text: $cep
                    )

                    MSInput(
                        title: "CNPJ", 
                        placeholder: "Digite seu CNPJ",
                        text: $cnpj
                    )
                }
                .padding(.bottom, 32)

                VStack(alignment: .leading) {
                    Text("Tipo de ponto*")

                    MSRadioButton(
                        "Coleta de doações",
                        isSelected: .init(
                            get: {
                                placeType == .donations
                            },
                            set: { _ in
                                if placeType != .donations {
                                    placeType = .donations
                                }
                            }
                        )
                    )

                    MSRadioButton(
                        "Abrigo para voluntários",
                        isSelected: .init(
                            get: {
                                placeType == .volunteers
                            },
                            set: { _ in
                                if placeType != .volunteers {
                                    placeType = .volunteers
                                }
                            }
                        )
                    )
                }
                .padding(.bottom, 32)

                VStack(spacing: 24) {
                    MSInput(
                        title: "Contato do responsável *",
                        placeholder: "Digite o telefone ou WhatsApp",
                        text: $localName
                    )

                    MSTextEditor("Observações Adicionais", text: $localName)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(Color.CaribbeanGreen.background.ignoresSafeArea())
    }
}

enum PlaceType{
    case volunteers
    case donations
}

#Preview {
    SignupView()
}

