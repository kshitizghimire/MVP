import UIKit

public struct TableSection {
    let header: HeaderFooterDisplaying?
    let cells: [CellDisplaying]
    let footer: HeaderFooterDisplaying?

    public init(
        header: HeaderFooterDisplaying? = nil,
        items: [CellDisplaying] = [],
        footer: HeaderFooterDisplaying? = nil
    ) {
        self.header = header
        cells = items
        self.footer = footer
    }
}

public protocol HeaderFooterDisplaying {
    var isDisplayable: Bool { get }
    func view(from tableView: UITableView, for section: Int) -> UIView
}

public extension HeaderFooterDisplaying {
    var isDisplayable: Bool {
        true
    }
}

public protocol CellDisplaying {
    var action: (() -> Void)? { get }
    func cell(from tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

public extension CellDisplaying {
    var action: (() -> Void)? {
        nil
    }
}
