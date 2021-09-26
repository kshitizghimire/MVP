import UIKit

final class CoinsPresenter: Presenting {
    private weak var display: TableDisplaying!
    private let title: String
    private let modelLoader: ModelLoading
    private let imageLoader: ImageLoading
    private let apiUrl: URL
    private let cellPlaceholderImage: UIImage

    init(
        display: TableDisplaying,
        title: String,
        modelLoader: ModelLoading,
        imageLoader: ImageLoading,
        apiUrl: URL,
        cellPlaceholderImage: UIImage
    ) {
        self.display = display
        self.title = title
        self.modelLoader = modelLoader
        self.imageLoader = imageLoader
        self.apiUrl = apiUrl
        self.cellPlaceholderImage = cellPlaceholderImage
    }

    func viewDidLoad() {
        display.set(title: title)

        modelLoader.load(
            for: [Coin].self,
            with: apiUrl
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let coins):
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
