//
//  Person.swift
//  
//
//  Created by Amresh Kumar on 20/03/21.
//

import Foundation
import Swin

protocol PersonProtocol {
    var cat: CatProtocol? { get set }
}

class Person: PersonProtocol, SwinInitializer {
    var cat: CatProtocol?
    
    class func create(_ args: [String : Any]?) -> Any? {
        let person = Person()
        person.cat = Swin.create(type: CatProtocol.self)
        return person
    }
}

protocol CatProtocol {
}

class Cat: CatProtocol, SwinInitializer {
    
    class func create(_ args: [String : Any]?) -> Any? {
        Cat()
    }
}

