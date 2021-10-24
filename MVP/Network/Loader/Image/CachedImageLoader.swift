import UIKit

/// A decorator for ImageLoading which enables caching
struct CachedImageLoader: ImageLoading {
    private let imageCache: ImageCacheReferenceType
    private let decoratee: ImageLoading

    init(
        imageLoader decoratee: ImageLoading,
        imageCache: ImageCaching
    ) {
        self.imageCache = ImageCacheReferenceType(imageCache)
        self.decoratee = decoratee
    }

    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = imageCache[url] {
            completion(.success(cachedImage))
        } else {
            decoratee.load(for: url) { result in
                switch result {
                case .success(let image):
                    imageCache[url] = image
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

private extension CachedImageLoader {
    final class ImageCacheReferenceType {
        private var imageCache: ImageCaching

        init(_ imageCache: ImageCaching) {
            self.imageCache = imageCache
        }

        subscript(key: AnyHashable) -> UIImage? {
            get {
                imageCache[key]
            }
            set {
                imageCache[key] = newValue
            }
        }
    }
}
