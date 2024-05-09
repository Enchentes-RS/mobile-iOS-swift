//
//  Shelter.swift
//  Enchente RS
//
//  Created by Marina De Pazzi on 07/05/24.
//

import Foundation

enum PointType: String, Codable {
    case volunteers
    case donations
    case acceptsPets = "accepts_pets"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)

        switch stringValue {
        case "volunteers":
            self = .volunteers
        case "donations":
            self = .donations
        default:
            self = .acceptsPets
        }
    }
}

enum Donations: String, Codable {
    case receiving
    case notReceiving

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)

        switch stringValue {
        case "receiving":
            self = .receiving
        default:
            self = .notReceiving
        }
    }
}

enum Volunteers: String, Codable {
    case receiving
    case notReceiving

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)

        switch stringValue {
        case "receiving":
            self = .receiving
        default:
            self = .notReceiving
        }
    }
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
    var volunteers: Volunteers?
    var donations: Donations?
    var cnpj: String?
    var pointType: PointType
    var contactPerson: String
    var additionalNotes: String?
    var whatsApp: String?
    var needsList: String?
    var surplusList: String?
    var pix: String?
}
