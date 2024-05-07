//
//  EnchenteRSApp.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

@main
struct EnchenteRSApp: App {

    init() {
        GMSServices.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
        GMSPlacesClient.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
    }

    var body: some Scene {
        WindowGroup {
            AppBody()
        }
    }
}

private struct AppBody: View {
    @Environment(\.scenePhase) var scenePhase
    @State var selection = 0

    var body: some View {
        VStack(spacing: .zero) {
            ZStack {
                Rectangle()
                    .fill(.clear)
                
                switch selection {
                case 0:
                    MapView()
                case 1:
                    SignupView()
                case 2:
                    InformationView()
                default:
                    fatalError("Index not supported")
                }
            }

            MSTabBar(selection: $selection, items: [
                MSTabBarItem(
                    image: Image(.map),
                    title: Text("Mapa")
                ),
                MSTabBarItem(
                    image: Image(.pin),
                    title: Text("Cadastrar local")
                ),
                MSTabBarItem(
                    image: Image(.info),
                    title: Text("Informações")
                )
            ])
        }
    }
}

