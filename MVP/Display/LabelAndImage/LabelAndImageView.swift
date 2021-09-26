import UIKit

final class LabelAndImageView: UIView {
    override init(
        frame: CGRect
    ) {
        super.init(frame: frame)

        addSubview(contentStackView)
        NSLayoutConstraint.activate(constraintsForAnchoringTo(boundsOf: contentStackView))
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelAndImage) {
        label.text = item.text
        icon.image = item.placeholderImage
        guard let url = URL(string: item.imageUrl) else {
            return
        }
        item.imageLoader.load(for: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(image):
                self.icon.image = image
            case .failure:
                break
            }
        }
    }

    private lazy var contentStackView: UIStackView = {
        let stackView = UIView.makeStackView(axis: .horizontal)

        stackView.addArrangedSubviews(
            UIView.makeSpace(width: 12),
            icon,
            UIView.makeSpace(width: 12),
            label
        )

        return stackView
    }()

    private lazy var icon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UIView.makeLabel(textStyle: .headline)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)

        return label
    }()
}
