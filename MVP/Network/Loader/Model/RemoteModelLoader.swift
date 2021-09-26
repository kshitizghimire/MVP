import Foundation

final class RemoteModelLoader: ModelLoading {
    let network: Networking
    let decoder: JSONDecoder

    init(network: Networking, decoder: JSONDecoder) {
        self.network = network
        self.decoder = decoder
    }

    func load<T: Decodable>(for _: T.Type, with url: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        network.perform(with: url) { [unowned self] result in
            switch result {
            case .success(let data):
                do {
                    let result = try self.decoder.decode(T.self, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
