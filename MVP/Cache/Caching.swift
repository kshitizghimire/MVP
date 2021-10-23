import Foundation

protocol Caching {
    associatedtype Key = AnyHashable
    associatedtype Value
    subscript(_: Key) -> Value? { get set }
}
