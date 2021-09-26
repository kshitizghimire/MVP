@testable import MVP

import Foundation

final class MockModelLoader<T: Decodable>: ModelLoading {
    typealias Closure = ((Result<T, Error>) -> Void)
    var completionHandler: Closure?
    func load<T: Decodable>(for _: T.Type, with _: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        self.completionHandler = completionHandler as? Closure
    }
}
