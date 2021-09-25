import Foundation

final class CoinsPresenter: Presenting {
    private weak var display: TableDisplay!
    private let coinLoader: Loading

    init(
        display: TableDisplay,
        coinLoader: Loading
    ) {
        self.display = display
        self.coinLoader = coinLoader
    }

    func viewDidLoad() {
        display.set(title: "Coins")

        coinLoader.load(for: [Coin].self) { [weak self] result in
            switch result {
            case let .success(coins):
                let items: [CellDisplaying] = coins.map {
                    LabelItem(title: $0.name)
                }
                self?.display.set(
                    sections: [
                        TableSectionItem(items: items),
                    ]
                )
            case .failure:
                break
            }
        }
    }
}
