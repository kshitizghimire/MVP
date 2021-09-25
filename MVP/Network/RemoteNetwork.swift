import Foundation

struct RemoteNetwork: Networking {
    init(
        session: URLSession = URLSession.shared,
        request: URLRequest
    ) {
        self.session = session
        self.request = request
    }

    private let session: URLSession
    private let request: URLRequest

    func perform(completion: @escaping (Result<Data, Error>) -> Void) {
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
