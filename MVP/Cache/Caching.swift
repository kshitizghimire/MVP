import Foundation

protocol Caching {
    func value(for key: AnyHashable) -> Any?
    func setValue(_ value: Any, for key: AnyHashable)
}
