import UIKit

extension LabelItem: HeaderFooterDisplaying {
    func view(from tableView: UITableView, for _: Int) -> UIView {
        tableView.register(
            LabelHeaderFooter.self,
            forHeaderFooterViewReuseIdentifier: LabelHeaderFooter.identifier
        )
        let view =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: LabelHeaderFooter.identifier)
                as! LabelHeaderFooter
        view.configure(with: self)

        return view
    }
}
