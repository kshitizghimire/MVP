@testable import MVP

import Foundation

final class MockModelLoader<T: Decodable>: ModelLoading {
    typealias Closure = ((Result<T, Error>) -> Void)
    var completion: Closure?
    func load<T: Decodable>(for _: URL, completion: @escaping (Result<T, Error>) -> Void) {
        self.completion = completion as? Closure
    }
}
