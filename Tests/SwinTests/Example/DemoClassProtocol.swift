import Foundation
import Swin

protocol DemoClassProtocol {
}

class DemoClass: DemoClassProtocol, SwinInitializer {
    class func create(_ args: [String : Any]?) -> Any? {
        DemoClass()
    }
}

class DemoClass2: DemoClassProtocol {
}
