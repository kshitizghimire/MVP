import Foundation
import UIKit

struct AppNavigator {
    let navigationController = UINavigationController()
    let network: Networking
    let cache: Caching
    let modelLoader: ModelLoading
    let imageLoader: ImageLoading
    let cachedImageLoader: CachedImageLoader

    init() {
        let remoteNetwork = RemoteNetwork()
        let mainThreadNetwork = MainThreadNetwork(network: remoteNetwork)
        network = mainThreadNetwork

        cache = MemoryCache()

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
            cellPlaceholderImage: UIImage(systemName: "car")!
        )
        display.presenter = presenter
        navigationController.pushViewController(display, animated: true)
        return navigationController
    }
}
