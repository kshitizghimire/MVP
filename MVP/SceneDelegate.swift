//
//  SceneDelegate.swift
//  MVP
//
//  Created by Tiz on 27/8/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let display = TableDisplay()

        let presenter = TablePresenter(display: display)
        display.presenter = presenter

        let navigationController = UINavigationController(rootViewController: display)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

}
