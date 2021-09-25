import Foundation

public struct LabelItem {
    let title: String
    public let action: (() -> Void)?

    public init(
        title: String,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.action = action
    }
}
