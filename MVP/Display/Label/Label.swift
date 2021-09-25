import Foundation

struct Label {
    let text: String
    let action: (() -> Void)?

    init(
        text: String,
        action: (() -> Void)? = nil
    ) {
        self.text = text
        self.action = action
    }
}
