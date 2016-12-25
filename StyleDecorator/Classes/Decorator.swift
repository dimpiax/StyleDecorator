//
//  Decorator.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation

public struct Decorator {
    fileprivate var _path: [Decorator]?
    
    fileprivate var _attributes: Attributes?
    
    // always filled, except raw decorator
    fileprivate var _text: String!
    
    public init(attributes: Attributes) {
        _attributes = attributes
    }
    
    public var styles: [(Attributes, NSRange)] {
        var location = 0
        return flatten().map { value -> (Attributes, NSRange)? in
            let count = value._text.characters.count
            defer { location += count }
            
            guard let attributes = value._attributes else { return nil }
            return (attributes, NSRange(location: location, length: count))
        }
        .flatMap { $0 }
    }
    
    public var string: String {
        return flatten().map { $0._text }.reduce("", +)
    }
    
    // PRIVATE
    private func flatten() -> [Decorator] {
        var arr = [Decorator]()
        var item = self
        
        // append tail
        while item._path != nil {
            var clearCopy = item
            clearCopy._path = nil
            arr.append(clearCopy)
            
            item = item._path!.first!
        }
        
        // append head
        var clearCopy = item
        clearCopy._path = nil
        arr.append(clearCopy)
        
        return arr.reversed()
    }
}

precedencegroup Bind {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator ~: Bind

// first part
public func ~(lhs: String, rhs: Decorator) -> Decorator {
    var copy = rhs
    copy._text = lhs
    
    return copy
}

// interim part
public func ~(lhs: Decorator, rhs: Decorator) -> Decorator {
    var copy: Decorator!
    
    if rhs._text == nil {
        copy = lhs
        copy._attributes = rhs._attributes
        
        // TODO: with _path
    }
    else {
        copy = rhs
        copy._path = [lhs]
    }
    
    return copy
}

// last part
public func ~(lhs: Decorator, rhs: String) -> Decorator {
    var copy = lhs
    copy._text = rhs
    copy._attributes = nil
    
    var copy2 = lhs
    copy._path = [copy2]
    
    return copy
}
