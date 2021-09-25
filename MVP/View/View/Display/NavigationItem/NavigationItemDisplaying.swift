import UIKit

public protocol NavigationItemDisplaying {
    func leftBarButtonItems(_ items: [NavigationItem])
    func rightBarButtonItems(_ items: [NavigationItem])
}

public extension NavigationItemDisplaying where Self: UIViewController {
    func leftBarButtonItems(_ items: [NavigationItem]) {
        navigationItem.leftBarButtonItems = items.map(\.barButtonItem)
    }

    func rightBarButtonItems(_ items: [NavigationItem]) {
        navigationItem.rightBarButtonItems = items.map(\.barButtonItem)
    }
}

private extension NavigationItem {
    var barButtonItem: UIBarButtonItem {
        final class NavigationBarButtonItem: UIBarButtonItem {
            private var barButtonAction: (() -> Void)?

            convenience init(
                image: UIImage,
                action: (() -> Void)?
            ) {
                self.init(
                    image: image,
                    style: .plain,
                    target: action,
                    action: #selector(barButtonTapped)
                )
                target = self
                barButtonAction = action
            }

            convenience init(
                title: String?,
                action: (() -> Void)?
            ) {
                self.init(
                    title: title,
                    style: .plain,
                    target: action,
                    action: #selector(barButtonTapped)
                )
                target = self
                barButtonAction = action
            }

            @objc private func barButtonTapped() {
                barButtonAction?()
            }
        }

        let item: NavigationBarButtonItem
        switch type {
        case let .icon(image):
            item = NavigationBarButtonItem(image: image, action: action)
        case let .text(title):
            item = NavigationBarButtonItem(title: title, action: action)
        }

        return item
    }
}
