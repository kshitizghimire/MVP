import Foundation

final class RemoteNetwork: Networking {
    private let session: URLSession

    init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    func perform(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            let result: Result<Data, Error>
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                result = .success(data)
            } else {
                result = .failure(URLError(URLError.Code.unknown))
            }
            completionHandler(result)
        }
        .resume()
    }
}
