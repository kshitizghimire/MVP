import Foundation
import UIKit

final class AppNavigator {
    var navigationController: UINavigationController!
    let dataLoader: DataLoading
    let imageCache: ImageCaching
    let modelLoader: ModelLoading
    let imageLoader: ImageLoading
    let cachedImageLoader: CachedImageLoader

    init() {
        let remoteDataLoader = RemoteDataLoader()
        let mainThreadDataLoader = MainThreadDataLoader(dataLoader: remoteDataLoader)
        dataLoader = mainThreadDataLoader

        let memoryCache = MemoryImageCache()
        imageCache = ThreadSafeImageCache(cache: memoryCache)

        modelLoader = RemoteModelLoader(
            dataLoader: dataLoader,
            decoder: JSONDecoder()
        )

        imageLoader = ImageLoader(dataLoader: dataLoader)
        cachedImageLoader = CachedImageLoader(imageLoader: imageLoader, imageCache: imageCache)
    }

    func start() -> UINavigationController {
        let display = TableDisplay()

        let presenter = CoinsPresenter(
            display: display,
            title: "Coins",
            modelLoader: modelLoader,
            imageLoader: cachedImageLoader,
            apiUrl: AppConfiguration.coinsApiUrl,
            cellPlaceholderImage: UIImage(systemName: "car") ?? UIImage(),
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
