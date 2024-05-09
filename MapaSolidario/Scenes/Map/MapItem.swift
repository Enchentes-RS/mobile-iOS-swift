//
//  MapItem.swift
//  Mapa Solidário
//
//  Created by Brenno de Moura on 08/05/24.
//

import Foundation
import GoogleMaps

struct MapItem {

    let shelter: Shelter
    let marker: GMSMarker

    init(_ shelter: Shelter) {
        self.shelter = shelter

        if let latitude = shelter.latitude, let longitude = shelter.longitude {
            self.marker = .init(position: .init(latitude: latitude, longitude: longitude))
        } else {
            self.marker = .init()
        }

        self.marker.userData = shelter
        self.marker.title = shelter.name
        self.marker.snippet = shelter.address
        self.marker.icon = Self.icon(shelter.pointType)
    }

    static func icon(_ type: String) -> UIImage? {
        switch type {
        case "donations":
            return .Pin.donation
        case "shelters":
            return .Pin.shelter
        default:
            return nil
        }
    }
}
