import Foundation

public class SwinDependencies: Dependencies {

    public var registry: DependencyStore = SimpleDependencyStore()

    public func append(_ dependency: Dependencies) {
        registry.extend(dependency.registry)
    }

    public func add<T, U>(type: T.Type, using: U.Type) where U: SwinInitializer {
        registry.set(U.self, for: String(describing: T.self))
    }

    public func add<T>(type: T.Type, createUsing block: @escaping () -> T) {
        registry.set(block, for: String(describing: T.self))
    }

    public func get<T>(for: T.Type) -> Any? {
        registry.get(String(describing: T.self))
    }

    public static func create(with createWith: (Dependencies) -> Void) -> Dependencies {
        let dependency = SwinDependencies()
        createWith(dependency)
        return dependency
    }
}
