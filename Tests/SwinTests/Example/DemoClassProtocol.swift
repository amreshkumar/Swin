import Foundation
import Swin

protocol DemoClassProtocol {
    var id: String? { get set }
}

class DemoClass: DemoClassProtocol, SwinInitializer {
    var id: String?
    
    class func create(_ args: [String : Any]?) -> Any? {
        DemoClass()
    }
}

class DemoClass2: DemoClassProtocol {
    var id: String?
}
