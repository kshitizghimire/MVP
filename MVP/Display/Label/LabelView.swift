import UIKit

final class LabelView: UIView {
    private var label = UILabel(frame: .zero)

    override init(
        frame: CGRect
    ) {
        super.init(frame: frame)

        addSubview(label)
        NSLayoutConstraint.activate(constraintsForAnchoringTo(boundsOf: label))
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: Label) {
        label.text = item.text
    }
}
