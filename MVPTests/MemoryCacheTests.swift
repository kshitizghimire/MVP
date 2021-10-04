@testable import MVP

import XCTest

final class MemoryCacheTests: XCTestCase {
    func testMemoryCache() throws {
        let cache = MemoryCache()

        XCTAssertNil(cache.value(for: "key"))
        cache.setValue("value", for: "key")
        let value = try XCTUnwrap(cache.value(for: "key") as? String)
        XCTAssertEqual(value, "value")
    }
}
