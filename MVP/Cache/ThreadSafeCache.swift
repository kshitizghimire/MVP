import Foundation

struct ThreadSafeCache<T: Caching>: Caching {
    private var decoratee: T
    private let lockQueue = DispatchQueue(label: "lock.queue", attributes: .concurrent)

    init(cache decoratee: T) {
        self.decoratee = decoratee
    }

    subscript(key: T.Key) -> T.Value? {
        get {
            lockQueue.sync {
                decoratee[key]
            }
        }
        set {
            lockQueue.sync(flags: .barrier) {
                decoratee[key] = newValue
            }
        }
    }
}
