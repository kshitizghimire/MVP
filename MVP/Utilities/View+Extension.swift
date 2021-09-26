import UIKit

extension UIView {
    static func makeSpace(height: CGFloat? = nil, width: CGFloat? = nil) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        return view
    }

    static func makeStackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        backgroundColor: UIColor? = nil
    ) -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.backgroundColor = backgroundColor

        return stackView
    }

    static func makeLabel(
        textAlignment: NSTextAlignment = .left,
        textStyle: UIFont.TextStyle = .body,
        textColor: UIColor = .label
    ) -> UILabel {
        let label = UILabel(frame: .zero)
        label.textAlignment = textAlignment
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        label.textColor = textColor

        return label
    }
}

extension UIStackView {
    func addArrangedSubviews(_ arrangedSubviews: UIView...) {
        arrangedSubviews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
