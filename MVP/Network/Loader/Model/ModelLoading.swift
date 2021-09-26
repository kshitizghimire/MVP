import Foundation
protocol ModelLoading {
    func load<T: Decodable>(for type: T.Type, with url: URL, completionHandler: @escaping (Result<T, Error>) -> Void)
}
