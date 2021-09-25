import Foundation

final class RemoteNetwork: Networking {
    enum RemoteNetworkError: Error {
        case general
    }

    init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    private let session: URLSession

    func perform(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, _, error in
            var result: Result<Data, Error> = .failure(RemoteNetworkError.general)
            if error != nil {
                result = .failure(RemoteNetworkError.general)
            } else if let data = data {
                result = .success(data)
            }

            completion(result)
        }
        .resume()
    }
}
