import Foundation

protocol Networking {
    func perform(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}
