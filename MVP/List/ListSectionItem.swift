import UIKit

struct ListSectionItem {
    let header: HeaderFooterDisplayable?
    let items: [CellDisplayable]
    let footer: HeaderFooterDisplayable?

    init(
        header: HeaderFooterDisplayable? = nil,
        items: [CellDisplayable] = [],
        footer: HeaderFooterDisplayable? = nil
    ) {
        self.header = header
        self.items = items
        self.footer = footer
    }

}

protocol HeaderFooterDisplayable {
    var isDisplayable: Bool { get }
    func view(from tableView: UITableView, for section: Int) -> UIView
}

extension HeaderFooterDisplayable {
    var isDisplayable: Bool {
        return true
    }
}

protocol CellDisplayable {
    var action: (() -> Void)? { get }
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

extension CellDisplayable {
    var action: (() -> Void)? {
        return nil
    }
}
