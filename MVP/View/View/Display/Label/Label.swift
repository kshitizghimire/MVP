import Foundation

public struct Label {
    let text: String
    public let action: (() -> Void)?

    public init(
        text: String,
        action: (() -> Void)? = nil
    ) {
        self.text = text
        self.action = action
    }
}
