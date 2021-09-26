import Foundation

protocol Networking {
    func perform(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void)
}
