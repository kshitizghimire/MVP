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
                LabelItem(title: "row2"),
                LabelItem(title: "row2"),
                LabelItem(title: "row2"),
                LabelItem(title: "row2"),
            ]
        }()
        display.set(
            sections: [TableSectionItem(items: items)]
        )
    }
}
