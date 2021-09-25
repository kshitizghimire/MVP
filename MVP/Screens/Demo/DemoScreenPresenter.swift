import UIKit
import View

final class DemoScreenPresenter: Presenting {
    private weak var display: TableDisplay!

    init(
        display: TableDisplay
    ) {
        self.display = display
    }

    func viewDidLoad() {
        display.set(title: "Hello")

        let items: [CellDisplaying] = {
            [
                LabelItem(title: "Row1") { print("Row 1") },
                LabelItem(title: "Row2"),
                LabelItem(title: "Row3"),
                LabelItem(title: "Row4"),
            ]
        }()

        display.set(
            sections: [
                TableSectionItem(
                    header: LabelItem(title: "Header"),
                    items: items,
                    footer: LabelItem(title: "Footer")
                ),
            ]
        )

        display.leftBarButtonItems(
            [
                NavigationItem(type: .text(title: "Left")) { [weak self] in
                    print("Left button tapped")
                    let count = Int.random(in: 0 ... 20)
                    let items = (0 ..< count)
                        .map { item in
                            LabelItem(title: "Row\(item)") { print("Row \(item)") }
                        }
                    self?.display
                        .set(sections: [
                            TableSectionItem(
                                header: LabelItem(title: "Header"),
                                items: items,
                                footer: LabelItem(title: "Footer")
                            ),
                        ]
                        )
                },
            ]
        )

        display.rightBarButtonItems(
            [
                NavigationItem(type: .icon(image: UIImage(systemName: "car")!)) {
                    print("Right button tapped")
                },
            ]
        )
    }
}
