import UIKit

/// A decorator for ImageLoading which enables caching
final class CachedImageLoader: ImageLoading {
    private let cache: Caching
    private let decoratee: ImageLoading

    init(
        imageLoader decoratee: ImageLoading,
        cache: Caching
    ) {
        self.cache = cache
        self.decoratee = decoratee
    }

    func load(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        if let cacheImage = cache.value(for: url) as? UIImage {
            completionHandler(.success(cacheImage))
        } else {
            decoratee.load(for: url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.cache.setValue(image, for: url)
                    completionHandler(.success(image))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
}
