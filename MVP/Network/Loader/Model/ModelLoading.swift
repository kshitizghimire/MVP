import Foundation

protocol ModelLoading {
    func load<T: Decodable>(for url: URL, with type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
