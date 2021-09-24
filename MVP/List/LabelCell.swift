//
//  LabelCell.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import UIKit

struct LabelItem {
    let title: String
}
class LabelView: UIView {
    private var item: LabelItem?

    private var label: UILabel = UILabel(frame: .zero)

    override init(
        frame: CGRect
    ) {
        super.init(frame: frame)
        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                self.topAnchor.constraint(equalTo: label.topAnchor),
                self.leadingAnchor.constraint(equalTo: label.leadingAnchor),
                self.bottomAnchor.constraint(equalTo: label.bottomAnchor),
                self.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            ]
        )
    }

    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with item: LabelItem) {
        self.item = item

        label.text = item.title
    }
}

class LabelCell: UITableViewCell {
    private let labelView: LabelView = LabelView(frame: .zero)

    override func awakeFromNib() {
        super.awakeFromNib()

        NSLayoutConstraint.activate(
            [

                contentView.topAnchor.constraint(equalTo: labelView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
                contentView.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            ]
        )
    }

    func configure(with item: LabelItem) {
        labelView.configure(with: item)
    }
}

class LabelHeaderFooter: UITableViewHeaderFooterView {
    private let labelView: LabelView = LabelView(frame: .zero)

    override func awakeFromNib() {
        super.awakeFromNib()

        NSLayoutConstraint.activate(
            [

                contentView.topAnchor.constraint(equalTo: labelView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
                contentView.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            ]
        )
    }

    func configure(with item: LabelItem) {
        labelView.configure(with: item)
    }
}

extension LabelItem: CellDisplayable {
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        tableView.register(LabelCell.self, forCellReuseIdentifier: LabelCell.identifier)
        let cell: LabelCell =
            tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath)
            as! LabelCell
        cell.configure(with: self)
        return cell
    }

}

extension LabelItem: HeaderFooterDisplayable {
    func view(from tableView: UITableView, for section: Int) -> UIView {
        tableView.register(
            LabelHeaderFooter.self,
            forHeaderFooterViewReuseIdentifier: LabelHeaderFooter.identifier
        )
        let view =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: LabelHeaderFooter.identifier)
            as! LabelHeaderFooter
        view.configure(with: self)
        return view
    }

}
