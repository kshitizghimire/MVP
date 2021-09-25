import Foundation

struct Coin: Codable {
    let id: String // swiftlint:disable:this identifier_name
    let symbol: String
    let name: String
    let image: String
}
