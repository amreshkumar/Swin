import Foundation

public protocol SwinDI {

    static var dependencies: Dependencies { get }

    static func add(_ dependency: Dependencies)

    static func register<T>(type: T.Type, createUsing block: @escaping () -> T)

    static func register<T, U>(type: T.Type, using: U.Type) where U: SwinInitializer

    static func create<T>(type: T.Type, args: [String: Any]?) -> T?

    static func replace(with newDependencyBlock: @escaping (Dependencies) -> Void) -> ReplaceToken
}
