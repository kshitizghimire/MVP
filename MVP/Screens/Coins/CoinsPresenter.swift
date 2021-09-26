import UIKit

final class CoinsPresenter: Presenting {
    private weak var display: TableDisplay!
    private let coinLoader: Loading
    private let imageLoader: ImageLoading
    private let apiUrl: URL
    private let cellPlaceholderImage: UIImage

    init(
        display: TableDisplay,
        coinLoader: Loading,
        imageLoader: ImageLoading,
        apiUrl: URL,
        cellPlaceholderImage: UIImage
    ) {
        self.display = display
        self.coinLoader = coinLoader
        self.imageLoader = imageLoader
        self.apiUrl = apiUrl
        self.cellPlaceholderImage = cellPlaceholderImage
    }

    func viewDidLoad() {
        display.set(title: "Coins")

        coinLoader.load(for: [Coin].self, with: apiUrl) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(coins):
                let cells: [CellDisplaying] = coins.map {
                    LabelAndImage(
                        text: $0.name,
                        placeholderImage: self.cellPlaceholderImage,
                        imageUrl: $0.image,
                        imageLoader: self.imageLoader
                    )
                }
                self.display.set(
                    sections: [
                        TableSection(cells: cells),
                    ]
                )
            case .failure:
                break
            }
        }
    }
}
