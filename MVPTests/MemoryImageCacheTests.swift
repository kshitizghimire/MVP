@testable import MVP

import XCTest

final class MemoryImageCacheTests: XCTestCase {
    func testMemoryCache() throws {
        var sut = MemoryImageCache()
        let image = UIImage(systemName: "car")

        XCTAssertNil(sut["key"])
        sut["key"] = image
        let value = try XCTUnwrap(sut["key"])
        XCTAssertEqual(value, image)
    }
}
