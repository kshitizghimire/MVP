import UIKit

public struct NavigationItem {
    public enum ItemType {
        case text(title: String)
        case icon(image: UIImage)
    }

    let type: ItemType
    let action: (() -> Void)?

    public init(
        type: ItemType,
        action: (() -> Void)? = nil
    ) {
        self.type = type
        self.action = action
    }
}
