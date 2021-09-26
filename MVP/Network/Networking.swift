import Foundation

protocol Networking: AnyObject {
    func perform(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void)
}
