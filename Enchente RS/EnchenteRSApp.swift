//
//  AppDelegate.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

@main
struct EnchenteRSApp: App {

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
            TabView(selection: $selection) {
                Text("Mapa")
                    .tag(0)

                Text("Cadastrar local")
                    .tag(1)

                Text("Informações")
                    .tag(2)
            }

            RSTabBar(selection: $selection, items: [
                RSTabBarItem(
                    image: Image(.map),
                    title: Text("Mapa")
                ),
                RSTabBarItem(
                    image: Image(.pin),
                    title: Text("Cadastrar local")
                ),
                RSTabBarItem(
                    image: Image(.info),
                    title: Text("Informações")
                )
            ])
        }
        .onChange(of: scenePhase) {
            if case .active = $0 {
                GMSServices.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
                GMSPlacesClient.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
            }
        }
    }
}

