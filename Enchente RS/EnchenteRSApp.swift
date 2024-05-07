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
                MapView()
                    .tag(0)

                SignupView()
                    .tag(1)

                InformationView()
                    .tag(2)
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
        .onChange(of: scenePhase) {
            if case .active = $0 {
                GMSServices.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
                GMSPlacesClient.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
            }
        }
    }
}

