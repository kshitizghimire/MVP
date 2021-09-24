//
//  Presenter.swift
//  MVP
//
//  Created by Kshitiz Ghimire on 24/9/21.
//

import Foundation

final class TablePresenter: Presenting {
    private weak var display: TableDisplay!

    init(
        display: TableDisplay
    ) {
        self.display = display
    }

    func viewDidLoad() {
        display.set(title: "Hello")

        let items: [CellDisplaying] = {
            return [
                LabelItem(title: "Row1"),
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
                )
            ]
        )
    }
}
