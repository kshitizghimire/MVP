import Foundation
import UIKit

struct ImageLoader: ImageLoading {
    enum ImageLoaderError: Error {
        case invalidImage
    }

    private let dataLoader: DataLoading

    init(dataLoader: DataLoading) {
        self.dataLoader = dataLoader
    }

    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        dataLoader.load(for: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completion(.failure(ImageLoaderError.invalidImage))
                    return
                }
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
