import Foundation

struct AppConfiguration {
    static var coinRequest: URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.coingecko.com"
        urlComponents.path = "/api/v3/coins/markets"
        urlComponents.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "1000"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "false"),
        ]

        return URLRequest(url: urlComponents.url!)
    }
}
