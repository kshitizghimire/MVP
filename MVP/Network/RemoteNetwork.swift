import Foundation

final class RemoteNetwork: Networking {
    init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    private let session: URLSession

    func perform(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, _, error in
            var result: Result<Data, Error> = .failure(URLError(URLError.Code.unknown))
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                result = .success(data)
            }

            completion(result)
        }
        .resume()
    }
}
