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

final class LabelView: UIView {
    private var item: LabelItem?
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
        self.item = item

        label.text = item.title
    }
}

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

    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LabelItem) {
        labelView.configure(with: item)
    }
}

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

extension LabelItem: CellDisplaying {
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        tableView.register(LabelCell.self, forCellReuseIdentifier: LabelCell.identifier)
        let cell: LabelCell =
            tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath)
            as! LabelCell
        cell.configure(with: self)

        return cell
    }
}

extension LabelItem: HeaderFooterDisplaying {
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
