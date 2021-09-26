import Foundation

protocol Caching: AnyObject {
    func object(for key: AnyObject) -> AnyObject?
    func setObject(_ object: AnyObject, for key: AnyObject)
}
