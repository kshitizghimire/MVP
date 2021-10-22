import Foundation
import UIKit

final class ImageLoader: ImageLoading {
    enum ImageDataError: Error {
        case unSupportedFormat
    }

    private let network: Networking

    init(network: Networking) {
        self.network = network
    }

    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        network.perform(with: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completion(.failure(ImageDataError.unSupportedFormat))
                    return
                }
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
