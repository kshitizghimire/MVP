import Foundation
import UIKit

protocol ImageLoading {
    func load(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}
