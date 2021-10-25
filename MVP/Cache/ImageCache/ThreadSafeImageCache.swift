import Foundation
import UIKit

struct ThreadSafeImageCache: ImageCaching {
    private var decoratee: ImageCaching
    private let lockQueue = DispatchQueue(label: "lock.queue", attributes: .concurrent)

    init(cache decoratee: ImageCaching) {
        self.decoratee = decoratee
    }

    subscript(key: AnyHashable) -> UIImage? {
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
