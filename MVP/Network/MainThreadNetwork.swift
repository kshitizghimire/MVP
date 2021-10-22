import Foundation

/// A decorator for Networking which dispatches completion closure on main thread.
final class MainThreadNetwork: Networking {
    private let decoratee: Networking

    init(
        network decoratee: Networking
    ) {
        self.decoratee = decoratee
    }

    func perform(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        decoratee.perform(with: url) { [weak self] result in
            guard let self = self else { return }
            self.performOnMainThread {
                completion(result)
            }
        }
    }

    private func performOnMainThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}
