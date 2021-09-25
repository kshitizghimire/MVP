import Foundation
final class CoinsPresenter: Presenting {
    private weak var display: TableDisplay!
    private let coinLoader: CoinLoading

    init(
        display: TableDisplay,
        coinLoader: CoinLoading
    ) {
        self.display = display
        self.coinLoader = coinLoader
    }

    func viewDidLoad() {
        coinLoader.load { [weak self] coins in
            let items: [CellDisplaying] = coins.map {
                LabelItem(title: $0.name)
            }
            self?.display.set(
                sections: [
                    TableSectionItem(items: items),
                ]
            )
        }
    }
}
