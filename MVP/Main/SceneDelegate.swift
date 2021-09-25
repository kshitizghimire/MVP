import UIKit
import View

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let display = TableDisplay()

        let presenter = DemoScreenPresenter(display: display)
        display.presenter = presenter

        let navigationController = UINavigationController(rootViewController: display)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
