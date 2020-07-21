import Foundation

public class ReplaceToken {

    private let restoreBlock: (_: Dependencies) -> Void
    
    private let oldDependency: Dependencies
    
    public init(with oldDependency: Dependencies, restoreUsing block: @escaping (_: Dependencies) -> Void) {
        self.oldDependency = oldDependency
        self.restoreBlock = block
    }
    
    public func restore() {
        return self.restoreBlock(oldDependency)
    }
}
