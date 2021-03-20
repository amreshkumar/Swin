//
//  Car.swift
//  
//
//  Created by Amresh Kumar on 20/03/21.
//

import Foundation
import Swin

protocol CarProtocol {
    var wheel: WheelProtocol? { get set }
}

class Car: CarProtocol {
    
    var wheel: WheelProtocol?
    
    class func createCar(wheel: WheelProtocol?) -> Car {
        let car = Car()
        car.wheel = wheel
        return car
    }
    
}

protocol WheelProtocol {
    
}

class Wheel: WheelProtocol, SwinInitializer {
    
    class func create(_ args: [String : Any]?) -> Any? {
        Wheel()
    }
}

