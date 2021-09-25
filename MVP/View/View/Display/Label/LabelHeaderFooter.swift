import UIKit

public final class LabelHeaderFooter: UITableViewHeaderFooterView {
    private let labelView = LabelView(frame: .zero)

    override init(
        reuseIdentifier: String?
    ) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelView)
        NSLayoutConstraint.activate(contentView.constraintsForAnchoringTo(boundsOf: labelView))
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: Label) {
        labelView.configure(with: item)
    }
}
