//
//  MapaSolidarioRSApp.swift
//  MapaSolidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import SwiftUI
import GoogleMaps
import GooglePlaces
import FirebaseCore
import FirebaseAnalytics
import FirebaseRemoteConfigSwift
import FirebaseRemoteConfig

@main
struct MapaSolidarioRSApp: App {

    init() {
        GMSServices.provideAPIKey("AIzaSyAwbYH61XG2oytqzMj0dhMQ8yNSvSxNAvI")
        Analytics.setAnalyticsCollectionEnabled(true)
        FirebaseApp.configure()

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemName: "Abriu APP",
        ])

        UITabBar.appearance().isHidden = true
    }

    var body: some Scene {
        WindowGroup {
            AppBody()
                .preferredColorScheme(.light) 
        }
    }
}

private struct AppBody: View {
    @Environment(\.scenePhase) var scenePhase
    @State var selection = 0
    var remoteConfig = RemoteConfig.remoteConfig()
    //    @RemoteConfigProperty(key:"exibir_cadastrar_local", fallback: true) private var isSignupViewEnabled: Bool

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

                    InformationWebView()
                        .tag(2)
                }
                .onChange(of: selection) { selection in
                    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                        AnalyticsParameterItemName: "Abas",
                        AnalyticsParameterContentType: "Aba: \(selection)",
                    ])
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
