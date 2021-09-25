import UIKit

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
