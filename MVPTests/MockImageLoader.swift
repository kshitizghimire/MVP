@testable import MVP

import UIKit

final class MockImageLoader: ImageLoading {
    var completion: ((Result<UIImage, Error>) -> Void)?
    func load(for _: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        self.completion = completion
    }
}
