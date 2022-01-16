import Foundation

protocol ModelLoading {
    func load<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void)
}
