import UIKit

public protocol TitleDisplaying {
    func set(title: String)
}

public extension TitleDisplaying where Self: UIViewController {
    func set(title: String) {
        self.title = title
    }
}
