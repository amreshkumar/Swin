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
    
    func testShouldBeAbleToRegisterDependencyFulfilledByBlock() {
        Swin.register(type: DemoClassProtocol.self) {
            let instance = DemoClass()
            instance.id = "TestId1"
            return instance
        }

        let instance = Swin.create(type: DemoClassProtocol.self)
        XCTAssertTrue(type(of: instance.unsafelyUnwrapped) == DemoClass.self)
        XCTAssertTrue(instance?.id == "TestId1")
    }
    
    func testShouldBeAbleToReplaceDependency() {
        Swin.register(type: DemoClassProtocol.self, using: DemoClass.self)

        let replaceToken = Swin.replace { dependencies in
            dependencies.add(type: DemoClassProtocol.self) {
                return DemoClass2()
            }
        }

        var instance = Swin.create(type: DemoClassProtocol.self)
        XCTAssertTrue(type(of: instance.unsafelyUnwrapped) == DemoClass2.self)

        replaceToken.restore()

        instance = Swin.create(type: DemoClassProtocol.self)
        XCTAssertTrue(type(of: instance.unsafelyUnwrapped) == DemoClass.self)

    }
    
    func testReturnNilForUnRegisteredDependency() {
        let dependency = SwinDependencies.create { store in
            store.add(type: DemoClassProtocol.self, using: DemoClass.self)
        }

        Swin.add(dependency)

        let instance = Swin.create(type: AnotherDemoClassProtocol.self)
        XCTAssertNil(instance)
    }
    
    func testShouldBeAbleToAddMultipleDependency() {
        let dependency = SwinDependencies.create { store in
            store.add(type: DemoClassProtocol.self, using: DemoClass.self)
            store.add(type: AnotherDemoClassProtocol.self, using: AnotherDemoClass.self)
        }

        Swin.add(dependency)

        let instance1 = Swin.create(type: AnotherDemoClassProtocol.self)
        XCTAssertNotNil(instance1)
        let instance2 = Swin.create(type: DemoClassProtocol.self)
        XCTAssertNotNil(instance2)
    }

    static var allTests = [
        ("testShouldBeAbleToAddDependency", testShouldBeAbleToAddDependency),
        ("testShouldBeAbleToRegisterDependencyByType", testShouldBeAbleToRegisterDependencyByType),
        ("testShouldBeAbleToRegisterDependencyFulfilledByBlock", testShouldBeAbleToRegisterDependencyFulfilledByBlock),
        ("testShouldBeAbleToReplaceDependency", testShouldBeAbleToReplaceDependency),
        ("testReturnNilForUnRegisteredDependency", testReturnNilForUnRegisteredDependency),
        ("testShouldBeAbleToAddMultipleDependency", testShouldBeAbleToAddMultipleDependency)
    ]
}
