import Foundation

public protocol SwinInitializer {

    static func create(_ args: [String: Any]?) -> Any?
}
