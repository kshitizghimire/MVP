import Foundation
import UIKit

protocol ImageCaching {
    subscript(_: AnyHashable) -> UIImage? { get set }
}
