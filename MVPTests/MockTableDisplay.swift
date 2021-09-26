@testable import MVP

import Foundation

final class MockTableDisplay: TableDisplaying {
    private(set) var sections: [TableSection]?
    func set(sections: [TableSection]) {
        self.sections = sections
    }

    private(set) var title: String?
    func set(title: String) {
        self.title = title
    }

    private(set) var leftBarButtons: [NavigationBarButton]?
    func setLeftBarButtons(_ buttons: [NavigationBarButton]) {
        leftBarButtons = buttons
    }

    private(set) var rightBarButtons: [NavigationBarButton]?
    func setRightBarButtons(_ buttons: [NavigationBarButton]) {
        rightBarButtons = buttons
    }
}
