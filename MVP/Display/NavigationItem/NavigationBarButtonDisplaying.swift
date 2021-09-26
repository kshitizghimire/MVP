import UIKit

protocol NavigationBarButtonDisplaying {
    func setLeftBarButtons(_ buttons: [NavigationBarButton])
    func setRightBarButtons(_ buttons: [NavigationBarButton])
}

extension NavigationBarButtonDisplaying where Self: UIViewController {
    func setLeftBarButtons(_ buttons: [NavigationBarButton]) {
        navigationItem.leftBarButtonItems = buttons.map(\.barButtonItem)
    }

    func setRightBarButtons(_ buttons: [NavigationBarButton]) {
        navigationItem.rightBarButtonItems = buttons.map(\.barButtonItem)
    }
}

extension NavigationBarButton {
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
        case .icon(let image):
            item = NavigationBarButtonItem(image: image, action: action)
        case .text(let title):
            item = NavigationBarButtonItem(title: title, action: action)
        }

        return item
    }
}
