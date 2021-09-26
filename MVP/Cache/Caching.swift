import Foundation

protocol Caching {
    func object(for key: AnyObject) -> Any?
    func setObject(_ object: AnyObject, for key: AnyObject)
}
