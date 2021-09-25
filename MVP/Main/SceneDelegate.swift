import UIKit

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

        let network = RemoteNetwork()
        let mainThreadNetwork = MainThreadNetwork(network)
        let coinLoader = CoinLoader(
            network: mainThreadNetwork,
            request: AppConfiguration.coinRequest,
            decoder: JSONDecoder()
        )
        let presenter = CoinsPresenter(display: display, coinLoader: coinLoader)
        display.presenter = presenter

        let navigationController = UINavigationController(rootViewController: display)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
