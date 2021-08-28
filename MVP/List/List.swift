import UIKit

final class List: NSObject {
    private let tableView: UITableView
    private var sections: [ListSectionItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    init(
        tableView: UITableView
    ) {
        self.tableView = tableView
        super.init()

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension List: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].items[indexPath.row]
            .cell(from: tableView, for: indexPath)
    }
}

extension List: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if let header = sections[section].header, header.isDisplayable {
            return UITableView.automaticDimension
        }
        else {
            return CGFloat.leastNormalMagnitude
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].header?
            .view(from: tableView, for: section)

    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footer?
            .view(from: tableView, for: section)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let footer = sections[section].footer, footer.isDisplayable {
            return UITableView.automaticDimension
        }
        else {
            return CGFloat.leastNormalMagnitude
        }
    }
}
