import UIKit

extension Label: CellDisplaying {
    public func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        tableView.register(LabelCell.self, forCellReuseIdentifier: LabelCell.identifier)
        let cell: LabelCell =
            tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath)
                as! LabelCell // swiftlint:disable:this force_cast
        cell.configure(with: self)

        return cell
    }
}
