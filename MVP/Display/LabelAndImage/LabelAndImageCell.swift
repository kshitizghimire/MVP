import UIKit

final class LabelAndImageCell: UITableViewCell {
    private let labelAndImageView = LabelAndImageView(frame: .zero)

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(labelAndImageView)
        NSLayoutConstraint.activate(contentView.constraintsForAnchoringTo(boundsOf: labelAndImageView))
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelAndImage) {
        labelAndImageView.configure(with: item)
    }
}
