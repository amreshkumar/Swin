import XCTest
@testable import Swin

final class SwinTests: XCTestCase {
    func testShouldBeAbleToAddDependency() {
        let dependency = SwinDependencies.create { store in
            store.add(type: DemoClassProtocol.self, using: DemoClass.self)
        }

        Swin.add(dependency)

        let instance = Swin.create(type: DemoClassProtocol.self)
        XCTAssertTrue(type(of: instance.unsafelyUnwrapped) == DemoClass.self)
    }

    func testShouldBeAbleToRegisterDependencyByType() {
        Swin.register(type: DemoClassProtocol.self, using: DemoClass.self)

        let instance = Swin.create(type: DemoClassProtocol.self)
        XCTAssertTrue(type(of: instance.unsafelyUnwrapped) == DemoClass.self)
    }

    static var allTests = [
        ("testShouldBeAbleToAddDependency", testShouldBeAbleToAddDependency),
        ("testShouldBeAbleToRegisterDependencyByType", testShouldBeAbleToRegisterDependencyByType),
    ]
}
