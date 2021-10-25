import Foundation

struct RemoteModelLoader: ModelLoading {
    enum RemoteModelLoaderError: Error {
        case decoding
        case network
    }

    let dataLoader: DataLoading
    let decoder: JSONDecoder

    init(dataLoader: DataLoading, decoder: JSONDecoder) {
        self.dataLoader = dataLoader
        self.decoder = decoder
    }

    func load<T: Decodable>(for url: URL, with type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        dataLoader.load(for: url) { result in
            switch result {
            case .success(let data):
                do {
                    let result = try self.decoder.decode(type, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(RemoteModelLoaderError.decoding))
                }
            case .failure:
                completion(.failure(RemoteModelLoaderError.network))
            }
        }
    }
}
