//
//  TableViewDisplayViewController.swift
//  MVP
//
//  Created by Tiz on 28/8/21.
//

import UIKit

protocol TableDisplaying: Displaying {
    func set(sections: [TableSectionItem])
}

final class TableDisplay: UIViewController {
    private let tableView: UITableView
    private var sections: [TableSectionItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private let containerView = UIView(frame: .zero)

    var presenter: Presenting!

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

        view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(view.constraintsForAnchoringTo(boundsOf: containerView))

        containerView.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(equalTo: tableView.topAnchor),
                containerView.leadingAnchor.constraint(
                    equalTo: tableView.leadingAnchor
                ),
                containerView.bottomAnchor.constraint(
                    equalTo: tableView.bottomAnchor
                ),
                containerView.trailingAnchor.constraint(
                    equalTo: tableView.trailingAnchor
                ),
            ]
        )
    }

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
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
    func set(sections: [TableSectionItem]) {
        self.sections = sections
    }
}
