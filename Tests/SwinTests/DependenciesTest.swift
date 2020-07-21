import XCTest
@testable import Swin

class DependenciesTest: XCTestCase {
    
    var dependencies: Dependencies!
    
    override func setUp() {
        dependencies = SwinDependencies()
    }
    
    override func tearDown() {
        dependencies = nil
    }
    
    func testShouldBeAbleToAddDependency() {
        dependencies.add(type: DemoClassProtocol.self, using: DemoClass.self)
        let type = dependencies.get(for: DemoClassProtocol.self) as? DemoClass.Type
        
        XCTAssertTrue(type != nil)
        XCTAssertTrue(type == DemoClass.self)
    }

    func testShouldBeAbleToAddBlockDependency() {
        dependencies.add(type: DemoClassProtocol.self) { DemoClass() }
        let type = dependencies.get(for: DemoClassProtocol.self)
        XCTAssertTrue(type != nil)
    }

    func testShouldBeAbleToCreate() {
        let dependency = SwinDependencies.create { store in
            store.add(type: DemoClassProtocol.self, using: DemoClass.self)
        }

        let type = dependency.get(for: DemoClassProtocol.self) as? DemoClass.Type

        XCTAssertTrue(type != nil)
        XCTAssertTrue(type == DemoClass.self)
    }

    func testShouldBeAbleToAppendToExistingDependecy() {
        let existingDependency = SwinDependencies()

        let newDependency = SwinDependencies.create { store in
            store.add(type: DemoClassProtocol.self, using: DemoClass.self)
        }

        existingDependency.append(newDependency)

        let type = existingDependency.get(for: DemoClassProtocol.self) as? DemoClass.Type

        XCTAssertTrue(type != nil)
        XCTAssertTrue(type == DemoClass.self)
    }
}
