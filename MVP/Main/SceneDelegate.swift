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
        let mainThreadNetwork = MainThreadNetwork(network: network)

        let coinLoader = RemoteModelLoader(
            network: mainThreadNetwork,
            decoder: JSONDecoder()
        )

        let imageLoader = RemoteImageLoader(network: mainThreadNetwork)
        let cachedImageLoader = CachedImageLoader(imageLoader: imageLoader, cache: MemoryCache())

        let presenter = CoinsPresenter(
            display: display,
            modelLoader: coinLoader,
            imageLoader: cachedImageLoader,
            apiUrl: AppConfiguration.coinsApiUrl,
            cellPlaceholderImage: UIImage(systemName: "car")!
        )
        display.presenter = presenter

        let navigationController = UINavigationController(rootViewController: display)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
