import Foundation

struct LabelItem {
    let title: String
    let action: (() -> Void)?

    init(
        title: String,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.action = action
    }
}
