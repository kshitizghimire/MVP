import Foundation
import UIKit

final class AppNavigator {
    var navigationController: UINavigationController!
    let dataLoader: DataLoading
    let cache: ThreadSafeCache<MemoryCache<URL, UIImage>>
    let modelLoader: ModelLoading
    let imageLoader: ImageLoading
    let cachedImageLoader: CachedImageLoader<ThreadSafeCache<MemoryCache<URL, UIImage>>>

    init() {
        let remoteDataLoader = RemoteDataLoader()
        let mainThreadDataLoader = MainThreadDataLoader(dataLoader: remoteDataLoader)
        dataLoader = mainThreadDataLoader

        let memoryCache = MemoryCache<URL, UIImage>()
        cache = ThreadSafeCache(cache: memoryCache)

        modelLoader = RemoteModelLoader(
            dataLoader: dataLoader,
            decoder: JSONDecoder()
        )

        imageLoader = ImageLoader(dataLoader: dataLoader)
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
