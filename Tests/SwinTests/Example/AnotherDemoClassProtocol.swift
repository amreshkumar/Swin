import Foundation
import Swin

protocol AnotherDemoClassProtocol {
}

class AnotherDemoClass: AnotherDemoClassProtocol, SwinInitializer {
    class func create(_ args: [String : Any]?) -> Any? {
        DemoClass()
    }
}
