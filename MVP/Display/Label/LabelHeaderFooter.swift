import UIKit

final class LabelHeaderFooter: UITableViewHeaderFooterView {
    private let labelView: LabelView = LabelView(frame: .zero)

    override init(
        reuseIdentifier: String?
    ) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelView)
        NSLayoutConstraint.activate(contentView.constraintsForAnchoringTo(boundsOf: labelView))
    }

    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelItem) {
        labelView.configure(with: item)
    }
}
