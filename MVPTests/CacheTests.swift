@testable import MVP

import XCTest

final class CacheTests: XCTestCase {
    func testCache() throws {
        var cache = Cache<String, String>()

        XCTAssertNil(cache["key"])
        cache["key"] = "value"
        let value = try XCTUnwrap(cache["key"])
        XCTAssertEqual(value, "value")
        cache["key"] = nil
        XCTAssertNil(cache["key"])
    }
}
