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
        case address
        case latitude
        case longitude
        case volunteers
        case donations
        case cnpj
        case pointType
        case contactPerson
        case additionalNotes
        case whatsApp = "whatsappGroup"
        case needsList
        case surplusList
        case pix
    }
    
    var id: String
    var name: String
    var cep: String
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var volunteers: String?
    var donations: String?
    var cnpj: String?
    var pointType: String
    var contactPerson: String
    var additionalNotes: String?
    var whatsApp: String?
    var needsList: String?
    var surplusList: String?
    var pix: String?
}
