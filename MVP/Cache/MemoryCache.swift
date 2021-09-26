import Foundation

final class MemoryCache: Caching {
    func object(for key: AnyObject) -> AnyObject? {
        cache.object(forKey: key)
    }

    func setObject(_ object: AnyObject, for key: AnyObject) {
        cache.setObject(object, forKey: key)
    }

    private let cache: NSCache<AnyObject, AnyObject> = NSCache()
}
