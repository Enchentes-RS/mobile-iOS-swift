//
//  SceneDelegate.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Garanta que a cena é uma cena de janela
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Crie uma janela dentro da cena
        let window = UIWindow(windowScene: windowScene)

        // Configure o controlador de tabulação como controlador raiz
        let tabBarViewController = TabBarViewController()
        window.rootViewController = tabBarViewController

        // Configure a janela principal
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
