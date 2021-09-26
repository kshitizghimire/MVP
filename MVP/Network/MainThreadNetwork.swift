import Foundation

/// A decorator for Networking which dispatches completion closure on main thread.
struct MainThreadNetwork: Networking {
    let decoratee: Networking

    init(
        _ decoratee: Networking
    ) {
        self.decoratee = decoratee
    }

    func perform(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        decoratee.perform(with: url) { result in
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
