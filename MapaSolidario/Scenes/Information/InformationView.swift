//
//  InformationView.swift
//  Mapa Solidário
//
//  Created by Brenno de Moura on 07/05/24.
//

import SwiftUI

struct InformationView: View {
    @State var acordionType: AcordionType?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Informações")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Lista de informações importantes")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 32)

                MSAccordion(
                    title: "Como pedir resgate",
                    isExpanded: .init(
                        get: {
                            acordionType == .rescue
                        }, set: {_,_ in
                            if acordionType == .rescue {
                                acordionType = nil
                            } else {
                                acordionType = .rescue
                            }
                        }
                    ),
                    content: {
                        Text("Como pedir resgate conteúdo")
                    }
                )

                MSAccordion(
                    title: "Ajuda Médica",
                    isExpanded: .init(
                        get: {
                            acordionType == .doctor
                        }, set: {_,_ in
                            if acordionType == .doctor {
                                acordionType = nil
                            } else {
                                acordionType = .doctor
                            }
                        }
                    ),
                    content: {
                        Text("Telefones emergenciais")
                    }
                )

                MSAccordion(
                    title: "Telefones emergenciais",
                    isExpanded: .init(
                        get: {
                            acordionType == .emergency
                        }, set: {_,_ in
                            if acordionType == .emergency {
                                acordionType = nil
                            } else {
                                acordionType = .emergency
                            }
                        }
                    ),
                    content: {
                        Text("Como pedir resgate conteúdo")
                    }
                )

                MSAccordion(
                    title: "Como doar por pix",
                    isExpanded: .init(
                        get: {
                            acordionType == .howGive
                        }, set: {_,_ in
                            if acordionType == .howGive {
                                acordionType = nil
                            } else {
                                acordionType = .howGive
                            }
                        }
                    ),
                    content: {
                        Text(
                         """
                         Eis as informações da chave Pix oficial do governo do RS:
                         chave: CNPJ 92.958.800/0001-38
                         destinatário: SOS Rio Grande do Sul
                         instituição: Banrisul (Banco do Estado do Rio Grande do Sul) “Se não aparecer isso na hora da doação é porque é golpe”, declarou Eduardo Leite. Segundo ele, essa é uma conta segura para doações, administrada pelo Estado com o acompanhamento de entidades.
"""
                        )
                    }
                )
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .background(Color.CaribbeanGreen.background)
    }
}

enum AcordionType {
    case rescue
    case doctor
    case emergency
    case howGive
}

#Preview {
    InformationView()
}
