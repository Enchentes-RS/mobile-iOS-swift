//
//  SignupModel.swift
//  Mapa Solidário
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 09/05/24.
//

import Foundation

struct SignupModel {
    var placeName: String
    var cep: String
    var cpf: String
    var type: PointType
    var phoneNumber: String
    var observations: String

    init(
        placeName: String = "",
        cep: String = "",
        cpf: String = "",
        type: PointType = .donations,
        phoneNumber: String = "",
        observations: String = ""
    ) {
        self.placeName = placeName
        self.cep = cep
        self.cpf = cpf
        self.type = type
        self.phoneNumber = phoneNumber
        self.observations = observations
    }
}
