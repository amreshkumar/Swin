public class Swin: SwinDI {

    public static var dependencies: Dependencies {
        return _dependencies
    }

    private static var _dependencies: Dependencies = SwinDependencies()

    public static func create<T>(type: T.Type, args: [String: Any]? = nil) -> T? {
        let creator = dependencies.get(for: type)

        if let creator = creator as? SwinInitializer.Type {
            return creator.create(args) as? T
        }
        else if let block = creator as? () -> T {
            return block()
        }
        
        return nil
    }

    public static func add(_ dependency: Dependencies) {
        dependencies.append(dependency)
    }

    public static func register<T>(type: T.Type, createUsing block: @escaping () -> T) {
        dependencies.add(type: type, createUsing: block)
    }

    public static func register<T, U>(type: T.Type, using: U.Type) where U: SwinInitializer {
        dependencies.add(type: type, using: using)
    }
    
    public static func replace(with newDependencyBlock: @escaping (Dependencies) -> Void) -> ReplaceToken {
        let token = ReplaceToken(with: dependencies) { oldDependency in
            Swin.replace(with: oldDependency)
        }

        newDependencyBlock(Swin.replace(with: SwinDependencies()))
        return token
    }
    
    @discardableResult
    private static func replace(with dependency: Dependencies) -> Dependencies {
        Swin._dependencies = dependency
        return dependency
    }
}
