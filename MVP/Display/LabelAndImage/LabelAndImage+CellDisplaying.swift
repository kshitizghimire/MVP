import UIKit
extension LabelAndImage: CellDisplaying {
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        tableView.register(LabelAndImageCell.self, forCellReuseIdentifier: LabelAndImageCell.identifier)
        let cell: LabelAndImageCell =
            tableView.dequeueReusableCell(withIdentifier: LabelAndImageCell.identifier, for: indexPath)
                as! LabelAndImageCell // swiftlint:disable:this force_cast
        cell.configure(with: self)

        return cell
    }
}
