import Foundation
import UIKit

struct LabelAndImage {
    let text: String
    let placeholderImage: UIImage
    let imageUrl: String
    let action: (() -> Void)?
    let imageLoader: ImageLoading

    init(
        text: String,
        placeholderImage: UIImage,
        imageUrl: String,
        imageLoader: ImageLoading,
        action: (() -> Void)? = nil

    ) {
        self.text = text
        self.placeholderImage = placeholderImage
        self.imageUrl = imageUrl
        self.imageLoader = imageLoader
        self.action = action
    }
}
