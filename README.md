
# Swin

How to...
## 1. Register dependency

 1.1 Using class name

    Swin.register(type: DemoClassProtocol.self, using: DemoClass.self) 

1.2 or, using blocks

    Swin.register(type: DemoClassProtocol.self) {
        let instance = DemoClass()
        // do more configurations
        return instance
    }

## 2. Create objects 

2.1 With no args

    let instanceObject = Swin.create(type: DemoClassProtocol.self)

2.2 or, with args

    let instanceObject = Swin.create(type: DemoClassProtocol.self, args: [String: Any]())

## 3. How are dependencies resolved in above case?
3.1 When using class name to resolve the dependency - the class must implement SwinInitializer protocol.
i.e. DemoClass should implement SwinInitializer protocol. For eg.
    
    class DemoClass: DemoClassProtocol, SwinInitializer {
        class func create(_ args: [String : Any]?) -> Any? {
            return DemoClass()
        }
    }

3.2 When using block notation to register dependency (1.2) - there is no additional requirement

## Future work
1. Add args support for block style register method


