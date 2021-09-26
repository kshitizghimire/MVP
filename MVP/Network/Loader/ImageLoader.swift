//
//  ImageLoader.swift
//  MVP
//
//  Created by Tiz on 26/9/21.
//

import Foundation
import UIKit
protocol ImageLoading {
    func load(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}

final class ImageLoader: ImageLoading {
    enum ImageLoaderError: Error {
        case general
    }

    init(cache: Caching, network: Networking) {
        self.cache = cache
        self.network = network
    }

    let cache: Caching
    let network: Networking

    func load(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        if let cacheImage = cache.object(for: url as NSURL) as? UIImage {
            completionHandler(.success(cacheImage))
        } else {
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
}
