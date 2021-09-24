import UIKit

struct NavigationItem {
    enum ItemType {
        case text(title: String)
        case icon(image: UIImage)
    }
    let type: ItemType
    let action: (() -> Void)?

    init(
        type: ItemType,
        action: (() -> Void)? = nil
    ) {
        self.type = type
        self.action = action
    }
}
