import Foundation

protocol Loading {
    func load<T: Decodable>(for type: T.Type, with url: URL, completionHandler: @escaping (Result<T, Error>) -> Void)
}

struct Loader: Loading {
    let network: Networking
    let decoder: JSONDecoder

    func load<T: Decodable>(for _: T.Type, with url: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        network.perform(with: url) { result in
            switch result {
            case let .success(data):
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
