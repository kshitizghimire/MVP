import Foundation
import UIKit

struct MemoryImageCache: ImageCaching {
    private var cache = Cache<AnyHashable, UIImage>()

    subscript(key: AnyHashable) -> UIImage? {
        get {
            cache[key]
        }
        set {
            cache[key] = newValue
        }
    }
}
