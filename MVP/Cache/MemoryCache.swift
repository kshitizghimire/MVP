import Foundation

struct MemoryCache<Key: Hashable, Value>: Caching {
    private var cache = Cache<Key, Value>()

    subscript(key: Key) -> Value? {
        get {
            cache[key]
        }
        set {
            cache[key] = newValue
        }
    }
}
