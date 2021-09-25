import Foundation

final class RemoteNetworkMainQueueDispatchDecorator: Networking {
    let decoratee: Networking

    init(
        decoratee: Networking
    ) {
        self.decoratee = decoratee
    }

    func perform(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        decoratee.perform(request: request) { [weak self] result in
            self?.guranteeMainThread {
                completion(result)
            }
        }
    }

    private func guranteeMainThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}
