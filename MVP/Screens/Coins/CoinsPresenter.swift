import UIKit

final class CoinsPresenter: Presenting {
    private weak var display: TableDisplaying!
    private let title: String
    private let modelLoader: ModelLoading
    private let imageLoader: ImageLoading
    private let apiUrl: URL
    private let cellPlaceholderImage: UIImage
    private let coinSelected: (Coin) -> Void

    init(
        display: TableDisplaying,
        title: String,
        modelLoader: ModelLoading,
        imageLoader: ImageLoading,
        apiUrl: URL,
        cellPlaceholderImage: UIImage,
        coinSelected: @escaping (Coin) -> Void
    ) {
        self.display = display
        self.title = title
        self.modelLoader = modelLoader
        self.imageLoader = imageLoader
        self.apiUrl = apiUrl
        self.cellPlaceholderImage = cellPlaceholderImage
        self.coinSelected = coinSelected
    }

    func viewDidLoad() {
        display.set(title: title)

        modelLoader.load(
            for: apiUrl,
            with: [Coin].self
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let coins):
                let cells: [CellDisplaying] = coins.map { coin in
                    LabelAndImage(
                        text: coin.name,
                        placeholderImage: self.cellPlaceholderImage,
                        imageUrl: coin.image,
                        imageLoader: self.imageLoader
                    ) {
                        self.coinSelected(coin)
                    }
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
