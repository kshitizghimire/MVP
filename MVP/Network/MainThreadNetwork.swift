import Foundation

/// A decorator for Networking which dispatches completion closure on main thread.
struct MainThreadNetwork: Networking {
    let decoratee: Networking

    init(
        _ decoratee: Networking
    ) {
        self.decoratee = decoratee
    }

    func perform(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        decoratee.perform(request: request) { result in
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
