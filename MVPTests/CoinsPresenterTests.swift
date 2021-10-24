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
            cellPlaceholderImage: UIImage(),
            coinSelected: { _ in }
        )
    }

    override func tearDownWithError() throws {
        mockModelLoader = nil
        mockDisplay = nil
        presenter = nil
    }

    func testViewDidLoad() throws {
        presenter.viewDidLoad()

        XCTAssertEqual(mockDisplay.title, "title")

        XCTAssertNil(mockDisplay.sections)

        let coins = [
            Coin(id: "1", symbol: "BTC", name: "Bitcoin", image: "https://test.com/1"),
            Coin(id: "2", symbol: "ETH", name: "Etherium", image: "https://test.com/2"),
            Coin(id: "4", symbol: "ADA", name: "Cardano", image: "https://test.com/4"),
            Coin(id: "3", symbol: "UNI", name: "UniSwap", image: "https://test.com/3"),
        ]
        mockModelLoader.completion?(.success(coins))
        XCTAssertEqual(mockDisplay.sections?.count, 1)
        let section: TableSection = try XCTUnwrap(mockDisplay.sections?[0])

        let cells = section.cells
        XCTAssertEqual(coins.count, 4)

        struct Test {
            let text: String
            let imageUrl: String
        }

        let expectedCells = [
            Test(text: "Bitcoin", imageUrl: "https://test.com/1"),
            Test(text: "Etherium", imageUrl: "https://test.com/2"),
            Test(text: "Cardano", imageUrl: "https://test.com/4"),
            Test(text: "UniSwap", imageUrl: "https://test.com/3"),
        ]
        zip(cells, expectedCells).forEach {
            let cell = $0 as? LabelAndImage
            XCTAssertEqual(cell?.text, $1.text)
            XCTAssertEqual(cell?.imageUrl, $1.imageUrl)
        }
    }
}
