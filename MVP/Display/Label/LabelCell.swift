import UIKit

final class LabelCell: UITableViewCell {
    private let labelView = LabelView(frame: .zero)

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelView)
        NSLayoutConstraint.activate(contentView.constraintsForAnchoringTo(boundsOf: labelView))
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelItem) {
        labelView.configure(with: item)
    }
}
