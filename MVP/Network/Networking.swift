import Foundation

protocol Networking {
    func perform(completion: @escaping (Result<Data, Error>) -> Void)
}
