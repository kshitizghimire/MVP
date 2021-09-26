import Foundation
import UIKit

protocol ImageLoading {
    func load(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}
