//
//  TableViewDisplayViewController.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import UIKit

protocol TitleDisplaying {

    func set(title: String?)
}

extension TitleDisplaying where Self: UIViewController {

    func set(title: String?) {
        self.title = title
    }
}

protocol Displaying: TitleDisplaying {}
protocol TableDisplaying: Displaying {
    func set(sections: [ListSectionItem])
}

final class TableDisplay: UIViewController {
    let tableView: UITableView
    private var sections: [ListSectionItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    let containerView = UIView(frame: .zero)

    var presenter: TablePresenting!

    init(
        tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    ) {
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                containerView.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor
                ),
                containerView.bottomAnchor.constraint(
                    equalTo: view.bottomAnchor
                ),
                containerView.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor
                ),
            ]
        )

        tableView.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(tableView)

        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
                tableView.leadingAnchor.constraint(
                    equalTo: containerView.leadingAnchor
                ),
                tableView.bottomAnchor.constraint(
                    equalTo: containerView.bottomAnchor
                ),
                tableView.trailingAnchor.constraint(
                    equalTo: containerView.trailingAnchor
                ),
            ]
        )

    }

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }

}

extension TableDisplay: UITableViewDataSource {

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

extension TableDisplay: UITableViewDelegate {

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

extension TableDisplay: TableDisplaying {
    func set(sections: [ListSectionItem]) {
        self.sections = sections
    }
}
