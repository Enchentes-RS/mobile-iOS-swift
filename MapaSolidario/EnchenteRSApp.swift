//
//  EnchenteRSApp.swift
//  MapaSolidario
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

        UITabBar.appearance().isHidden = true
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
    @State var shownIndex = Set<Int>()

    var body: some View {
        VStack(spacing: .zero) {
            ZStack {
                Rectangle()
                    .fill(.clear)
                
                TabView(selection: $selection) {
                    MapView()
                        .tag(0)

                    SignupView()
                        .tag(1)

                    InformationView()
                        .tag(2)
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

