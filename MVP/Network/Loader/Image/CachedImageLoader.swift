import UIKit

/// A decorator for ImageLoading which enables caching
final class CachedImageLoader<T: Caching>: ImageLoading where T.Key == URL, T.Value == UIImage {
    private var cache: T
    private let decoratee: ImageLoading

    init(
        imageLoader decoratee: ImageLoading,
        cache: T
    ) {
        self.cache = cache
        self.decoratee = decoratee
    }

    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cacheImage = cache[url] {
            completion(.success(cacheImage))
        } else {
            decoratee.load(for: url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.cache[url] = image
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
