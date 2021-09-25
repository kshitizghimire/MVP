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
                Label(text: "Row1") { print("Row 1") },
                Label(text: "Row2"),
                Label(text: "Row3"),
                Label(text: "Row4"),
            ]
        }()

        display.set(
            sections: [
                TableSection(
                    header: Label(text: "Header"),
                    items: items,
                    footer: Label(text: "Footer")
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
                            Label(text: "Row\(item)") { print("Row \(item)") }
                        }
                    self?.display
                        .set(sections: [
                            TableSection(
                                header: Label(text: "Header"),
                                items: items,
                                footer: Label(text: "Footer")
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
