import Foundation

struct ThreadSafeCache: Caching {
    private let decoratee: Caching
    private let lockQueue = DispatchQueue(label: "lock.queue", attributes: .concurrent)

    func value(for key: AnyHashable) -> Any? {
        lockQueue.sync {
            decoratee.value(for: key)
        }
    }

    func setValue(_ value: Any, for key: AnyHashable) {
        lockQueue.sync(flags: .barrier) {
            decoratee.setValue(value, for: key)
        }
    }
}
