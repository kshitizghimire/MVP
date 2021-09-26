import Foundation

final class CoinsPresenter: Presenting {
    private weak var display: TableDisplay!
    private let coinLoader: Loading
    private let apiUrl: URL

    init(
        display: TableDisplay,
        coinLoader: Loading,
        apiUrl: URL
    ) {
        self.display = display
        self.coinLoader = coinLoader
        self.apiUrl = apiUrl
    }

    func viewDidLoad() {
        display.set(title: "Coins")

        coinLoader.load(for: [Coin].self, with: apiUrl) { [weak self] result in
            switch result {
            case let .success(coins):
                let items: [CellDisplaying] = coins.map {
                    Label(text: $0.name)
                }
                self?.display.set(
                    sections: [
                        TableSection(items: items),
                    ]
                )
            case .failure:
                break
            }
        }
    }
}
