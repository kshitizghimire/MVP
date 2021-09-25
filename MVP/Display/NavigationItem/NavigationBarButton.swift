import UIKit

struct NavigationBarButton {
    enum BarButtonType {
        case text(title: String)
        case icon(image: UIImage)
    }

    let type: BarButtonType
    let action: (() -> Void)?

    init(
        type: BarButtonType,
        action: (() -> Void)? = nil
    ) {
        self.type = type
        self.action = action
    }
}
