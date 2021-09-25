import UIKit

public protocol TableDisplaying: Displaying {
    func set(sections: [TableSectionItem])
}

public final class TableDisplay: UIViewController {
    public var presenter: Presenting!

    private var sections: [TableSectionItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private let tableView: UITableView
    private let containerView = UIView(frame: .zero)

    public init(
        tableView: UITableView = UITableView(frame: .zero, style: .plain)
    ) {
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    @available(*, unavailable)
    required init?(
        coder _: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        super.loadView()

        view.addSubview(containerView)
        NSLayoutConstraint.activate(
            view.constraintsForAnchoringTo(boundsOf: containerView)
        )

        containerView.addSubview(tableView)
        NSLayoutConstraint.activate(
            containerView.constraintsForAnchoringTo(boundsOf: tableView)
        )
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }
}

extension TableDisplay: UITableViewDataSource {
    public func numberOfSections(in _: UITableView) -> Int {
        sections.count
    }

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].items[indexPath.row]
            .cell(from: tableView, for: indexPath)
    }
}

extension TableDisplay: UITableViewDelegate {
    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].items[indexPath.row]
            .action?()
    }

    public func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let header = sections[section].header, header.isDisplayable {
            return UITableView.automaticDimension
        } else {
            return CGFloat.leastNormalMagnitude
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].header?
            .view(from: tableView, for: section)
    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footer?
            .view(from: tableView, for: section)
    }

    public func tableView(_: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let footer = sections[section].footer, footer.isDisplayable {
            return UITableView.automaticDimension
        } else {
            return CGFloat.leastNormalMagnitude
        }
    }
}

extension TableDisplay: TableDisplaying {
    public func set(sections: [TableSectionItem]) {
        self.sections = sections
    }
}
