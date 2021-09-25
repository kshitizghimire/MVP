import Foundation

protocol Loading {
    func load<T: Decodable>(for type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

struct Loader: Loading {
    let network: Networking
    let request: URLRequest
    let decoder: JSONDecoder

    func load<T: Decodable>(for _: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        network.perform(request: request) { result in
            switch result {
            case let .success(data):
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
