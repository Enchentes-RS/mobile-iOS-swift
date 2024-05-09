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
          AnalyticsParameterItemID: "id-\("teste!")",
          AnalyticsParameterItemName: "teste2",
          AnalyticsParameterContentType: "cont",
        ])

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-\("teste!")",
                  AnalyticsParameterItemName: "teste2",
                  AnalyticsParameterContentType: "cont",
                ])
        setupRemoteConfig()
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
    var remoteConfig = RemoteConfig.remoteConfig()
    @RemoteConfigProperty(key:"exibir_cadastrar_local", fallback: true) private var isSignupViewEnabled: Bool

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
                isSignupViewEnabled ?
                    MSTabBarItem(
                        image: Image(.pin),
                        title: Text("Cadastrar local")
                    ): nil,
                MSTabBarItem(
                    image: Image(.info),
                    title: Text("Informações")
                )
            ].compactMap { $0 }
            )
        }
        .onAppear {
            remoteConfig.fetchAndActivate()
        }
    }
}

extension MapaSolidarioRSApp {

    class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
        // Implemente os métodos necessários da UNUserNotificationCenterDelegate
    }

    func setupRemoteConfig() {
        var remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(["exibir_cadastrar_local": true as NSObject])

        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings

        remoteConfig.fetch(withExpirationDuration: 0) {
            status, error in
            if status == .success, error == nil {
                let value = remoteConfig.configValue(forKey: "exibir_cadastrar_local").boolValue
            }
        }
    }
}
