import Foundation

final class MemoryCache: Caching {
    private var cache = Cache<AnyHashable, Any>()

    func value(for key: AnyHashable) -> Any? {
        cache[key]
    }

    func setValue(_ value: Any, for key: AnyHashable) {
        cache[key] = value
    }
}
