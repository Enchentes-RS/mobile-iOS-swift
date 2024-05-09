//
//  MenuViewController.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI
import MessageUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel(service: .init())
    @State var localName = ""
    @State var cep = ""
    @State var cnpj = ""
    @State var placeType: PointType = .donations
    @State var isShowingMailView = false

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
                        title: "Nome do Local*",
                        placeholder: "Digite o nome do local",
                        text: $viewModel.signupModel.placeName
                    )

                    MSInput(
                        title: "CEP*",
                        placeholder: "Digite o CEP do local",
                        text: $viewModel.signupModel.cep
                    )

                    MSInput(
                        title: "CPF*",
                        placeholder: "Digite seu CPF",
                        text: $viewModel.signupModel.cpf
                    )
                }
                .padding(.bottom, 32)

                VStack(alignment: .leading) {
                    Text("Tipo de ponto*")
                        .font(.headline)
                        .foregroundColor(.black)

                    MSRadioButton(
                        "Coleta de doações",
                        isSelected: .init(
                            get: {
                                viewModel.signupModel.type == .donations
                            },
                            set: { _ in
                                if viewModel.signupModel.type != .donations {
                                    viewModel.signupModel.type = .donations
                                }
                            }
                        )
                    )

                    MSRadioButton(
                        "Abrigo para voluntários",
                        isSelected: .init(
                            get: {
                                viewModel.signupModel.type == .volunteers
                            },
                            set: { _ in
                                if viewModel.signupModel.type != .volunteers {
                                    viewModel.signupModel.type = .volunteers
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
                        text: $viewModel.signupModel.phoneNumber
                    )

                    MSTextEditor(
                        "Observações Adicionais",
                        text: $viewModel.signupModel.observations
                    )

                    MSButton(
                        "Enviar",
                             type: isDisableButton ? .disable : .primary
                    ) {
                        if !isDisableButton {
                            viewModel.sendEmail()
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowingMailView) {
                //                ContentView()
            }
            .padding(.horizontal, 16)
        }
        .background(Color.CaribbeanGreen.background.ignoresSafeArea())
    }
}

extension SignupView {

    var isDisableButton: Bool {
        return viewModel.signupModel.placeName.isEmpty
        || viewModel.signupModel.cep.isEmpty
        || viewModel.signupModel.cpf.isEmpty
        || viewModel.signupModel.phoneNumber.isEmpty
        || viewModel.signupModel.observations.isEmpty
    }
}

#Preview {
    SignupView()
}
