import Foundation

final class RemoteNetwork: Networking {
    enum RemoteNetworkError: Error {
        case general
    }

    private let session: URLSession

    init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    func perform(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(RemoteNetworkError.general))
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
