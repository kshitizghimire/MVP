import UIKit

/// A decorator for ImageLoading which enables caching
struct CachedImageLoader<T: Caching>: ImageLoading where T.Key == URL, T.Value == UIImage {
    private let cache: CacheReferenceType
    private let decoratee: ImageLoading

    init(
        imageLoader decoratee: ImageLoading,
        cache: T
    ) {
        self.cache = CacheReferenceType(cache: cache)
        self.decoratee = decoratee
    }

    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cacheImage = cache[url] {
            completion(.success(cacheImage))
        } else {
            decoratee.load(for: url) { result in
                switch result {
                case .success(let image):
                    cache[url] = image
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

private extension CachedImageLoader {
    final class CacheReferenceType {
        private var cache: T

        init(cache: T) {
            self.cache = cache
        }

        subscript(key: T.Key) -> T.Value? {
            get {
                cache[key]
            }
            set {
                cache[key] = newValue
            }
        }
    }
}
