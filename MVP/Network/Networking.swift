import Foundation

protocol Networking: AnyObject {
    func perform(with url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
