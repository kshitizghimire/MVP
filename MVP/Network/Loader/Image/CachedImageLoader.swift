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
        if let cacheImage = cache.object(for: url as NSURL) as? UIImage {
            completionHandler(.success(cacheImage))
        } else {
            decoratee.load(for: url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(image):
                    self.cache.setObject(image, for: url as NSURL)
                    completionHandler(.success(image))
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
}
