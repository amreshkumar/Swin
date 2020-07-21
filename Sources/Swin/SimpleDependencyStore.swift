import Foundation

public class SimpleDependencyStore: DependencyStore {

    var registry = [String: Any]()

    public func get(_ key: String) -> Any? {
        registry[key]
    }

    public func set(_ value: Any, for key: String) {
        registry[key] = value
    }

    public func extend(_ registry: DependencyStore) {
        for key in registry.keys() {
            self.registry[key] = registry.get(key)
        }
    }

    public func keys() -> [String] {
        return Array(registry.keys)
    }
}
