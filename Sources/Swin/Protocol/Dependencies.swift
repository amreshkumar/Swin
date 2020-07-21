import Foundation

public protocol Dependencies {

    var registry: DependencyStore { get }

    func add<T, U>(type: T.Type, using: U.Type) where U: SwinInitializer

    func add<T>(type: T.Type, createUsing block: @escaping () -> T)
    
    func get<T>(for: T.Type) -> Any?

    func append(_ dependency: Dependencies)

    static func create(with createWith: (Dependencies) -> Void) -> Dependencies

}
