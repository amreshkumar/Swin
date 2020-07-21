import Foundation

public protocol DependencyStore {

    func get(_ key: String) -> Any?

    func set(_ value: Any, for key: String)

    func extend(_ registry: DependencyStore)

    func keys() -> [String]
}
