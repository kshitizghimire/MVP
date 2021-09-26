import Foundation

/// A decorator for Networking which dispatches completion closure on main thread.
final class MainThreadNetwork: Networking {
    private let decoratee: Networking

    init(
        network decoratee: Networking
    ) {
        self.decoratee = decoratee
    }

    func perform(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        decoratee.perform(with: url) { [unowned self] result in
            self.performOnMainThread {
                completionHandler(result)
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
