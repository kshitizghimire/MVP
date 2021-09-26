import Foundation
import UIKit

final class RemoteImageLoader: ImageLoading {
    enum ImageLoaderError: Error {
        case general
    }

    private let network: Networking

    init(network: Networking) {
        self.network = network
    }

    func load(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        network.perform(with: url) { result in
            switch result {
            case let .success(data):
                guard let image = UIImage(data: data) else {
                    completionHandler(.failure(ImageLoaderError.general))
                    return
                }
                completionHandler(.success(image))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
