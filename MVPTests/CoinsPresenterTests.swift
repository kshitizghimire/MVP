@testable import MVP

import XCTest

final class CoinsPresenterTests: XCTestCase {
    var mockModelLoader: MockModelLoader<[Coin]>!
    var mockDisplay: MockTableDisplay!
    var presenter: CoinsPresenter!
    override func setUpWithError() throws {
        mockModelLoader = MockModelLoader<[Coin]>()
        mockDisplay = MockTableDisplay()
        presenter = CoinsPresenter(
            display: mockDisplay,
            title: "title",
            modelLoader: mockModelLoader,
            imageLoader: MockImageLoader(),
            apiUrl: URL(string: "http://test.com")!,
            cellPlaceholderImage: UIImage()
        )
    }

    override func tearDownWithError() throws {
        mockModelLoader = nil
        mockDisplay = nil
        presenter = nil
    }

    func testViewDidLoad() {
        presenter.viewDidLoad()

        XCTAssertEqual(mockDisplay.title, "title")

        XCTAssertNil(mockDisplay.sections)

        let coins = [
            Coin(id: "1", symbol: "BTC", name: "Bitcoin", image: "https://test.com"),
        ]
        mockModelLoader.completionHandler?(.success(coins))
        XCTAssertEqual(mockDisplay.sections?.count, 1)
    }
}
