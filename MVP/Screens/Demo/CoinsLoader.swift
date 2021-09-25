import Foundation

struct Coin: Codable {
    let id: String // swiftlint:disable:this identifier_name
    let symbol: String
    let name: String
    let image: String
}

enum CoinLoaderError: Error {
    case general
}

protocol CoinLoading {
    func load(completion: @escaping ([Coin]) -> Void)
}

struct CoinLoader: CoinLoading {
    let network: Networking
    let request: URLRequest
    let decoder: JSONDecoder

    func load(completion: @escaping ([Coin]) -> Void) {
        network.perform(request: request) { result in
            let coins: [Coin]
            switch result {
            case let .success(data):
                coins = (try? decoder.decode([Coin].self, from: data)) ?? []
            case .failure:
                coins = []
            }
            completion(coins)
        }
    }
}
