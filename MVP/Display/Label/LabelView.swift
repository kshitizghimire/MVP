import UIKit

final class LabelView: UIView {
    private var label: UILabel = UILabel(frame: .zero)

    override init(
        frame: CGRect
    ) {
        super.init(frame: frame)

        self.addSubview(label)
        NSLayoutConstraint.activate(self.constraintsForAnchoringTo(boundsOf: label))
    }

    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelItem) {
        label.text = item.title
    }
}
