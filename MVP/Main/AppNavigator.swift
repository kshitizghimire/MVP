import Foundation
import UIKit

final class AppNavigator {
    var navigationController: UINavigationController!
    let network: Networking
    let cache: Caching
    let modelLoader: ModelLoading
    let imageLoader: ImageLoading
    let cachedImageLoader: CachedImageLoader

    init() {
        let remoteNetwork = RemoteNetwork()
        let mainThreadNetwork = MainThreadNetwork(network: remoteNetwork)
        network = mainThreadNetwork

        let memoryCache = MemoryCache()
        cache = ThreadSafeCache(cache: memoryCache)

        modelLoader = RemoteModelLoader(
            network: network,
            decoder: JSONDecoder()
        )

        imageLoader = RemoteImageLoader(network: network)
        cachedImageLoader = CachedImageLoader(imageLoader: imageLoader, cache: cache)
    }

    func start() -> UINavigationController {
        let display = TableDisplay()

        let presenter = CoinsPresenter(
            display: display,
            title: "Coins",
            modelLoader: modelLoader,
            imageLoader: cachedImageLoader,
            apiUrl: AppConfiguration.coinsApiUrl,
            cellPlaceholderImage: UIImage(systemName: "car")!,
            coinSelected: coinDetailAction
        )
        display.presenter = presenter
        navigationController = UINavigationController(rootViewController: display)
        return navigationController
    }

    lazy var coinDetailAction: (Coin) -> Void = { [weak self] _ in
        let display = TableDisplay()
        let presenter = DemoScreenPresenter(display: display)
        display.presenter = presenter
        self?.navigationController.pushViewController(display, animated: true)
    }
}
