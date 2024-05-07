//
//  Shelter.swift
//  Enchente RS
//
//  Created by Marina De Pazzi on 07/05/24.
//

import Foundation

enum PointType: Codable {
    enum CodingKeys: String, CodingKey {
        case volunteers
        case donations
        case acceptsPets = "accepts_pets"
    }
    case volunteers
    case donations
    case acceptsPets
}

struct Shelter: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case cep
        case cnpj
        case pointType
        case contactPerson
        case additionalNotes
    }
    
    var id: String
    var name: String
    var cep: String
    var cnpj: String
    var pointType: PointType
    var contactPerson: String
    var additionalNotes: String
}
