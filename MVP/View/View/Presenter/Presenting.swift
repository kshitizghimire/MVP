import Foundation

public protocol Presenting {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

public extension Presenting {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
