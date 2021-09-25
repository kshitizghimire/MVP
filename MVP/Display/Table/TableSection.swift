import UIKit

struct TableSection {
    let header: HeaderFooterDisplaying?
    let cells: [CellDisplaying]
    let footer: HeaderFooterDisplaying?

    init(
        header: HeaderFooterDisplaying? = nil,
        items: [CellDisplaying] = [],
        footer: HeaderFooterDisplaying? = nil
    ) {
        self.header = header
        cells = items
        self.footer = footer
    }
}

protocol HeaderFooterDisplaying {
    var isDisplayable: Bool { get }
    func view(from tableView: UITableView, for section: Int) -> UIView
}

extension HeaderFooterDisplaying {
    var isDisplayable: Bool {
        true
    }
}

protocol CellDisplaying {
    var action: (() -> Void)? { get }
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

extension CellDisplaying {
    var action: (() -> Void)? {
        nil
    }
}
