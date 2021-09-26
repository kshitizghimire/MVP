@testable import MVP

import XCTest

final class CoinsPresenterTests: XCTestCase {
    func testTitle() {
        let modelLoader = MockModelLoader<[Coin]>()
        let mockDisplay = MockTableDisplay()
        let sut = CoinsPresenter(
            display: mockDisplay,
            title: "title",
            modelLoader: modelLoader,
            imageLoader: MockImageLoader(),
            apiUrl: URL(string: "http://test.com")!,
            cellPlaceholderImage: UIImage()
        )
        sut.viewDidLoad()

        XCTAssertEqual(mockDisplay.title, "title")
    }
}
