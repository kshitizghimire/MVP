@testable import MVP

import UIKit

final class MockImageLoader: ImageLoading {
    var completionHandler: ((Result<UIImage, Error>) -> Void)?
    func load(for _: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        self.completionHandler = completionHandler
    }
}
