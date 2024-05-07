//
//  GeoPoint.swift
//  Enchente RS
//
//  Created by Marina De Pazzi on 07/05/24.
//

import Foundation

struct GeoPoint: Codable {
    enum CodingKeys: String, CodingKey {
        case local = "LOCAL"
        case volunteers = "VOLUNTARIOS"
        case donations = "DOACOES"
        case address = "ENDERECO"
        case latitude = "LATITUDE"
        case longitude = "LONGITUDE"
        case whatsApp = "GRUPO WHATS"
        case obs = "OBS"
    }
    
    var local: String?
    var volunteers: String?
    var donations: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var whatsApp: String?
    var obs: String
}
