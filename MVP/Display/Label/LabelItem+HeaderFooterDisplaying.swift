import UIKit

extension LabelItem: HeaderFooterDisplaying {
    func view(from tableView: UITableView, for _: Int) -> UIView {
        tableView.register(
            LabelHeaderFooter.self,
            forHeaderFooterViewReuseIdentifier: LabelHeaderFooter.identifier
        )
        let view =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: LabelHeaderFooter.identifier)
                as! LabelHeaderFooter // swiftlint:disable:this force_cast
        view.configure(with: self)

        return view
    }
}
