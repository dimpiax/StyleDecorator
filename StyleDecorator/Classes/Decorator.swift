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
        return flatten().flatMap { value -> (Attributes, NSRange)? in
            let count = value._text.characters.count
            defer { location += count }
            
            guard let attributes = value._attributes else { return nil }
            return (attributes, NSRange(location: location, length: count))
        }
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
    
    static fileprivate func setTailPath(_ value: Decorator, to parent: inout Decorator) {
        if parent._path == nil {
            parent._path = [value]
            return
        }
        
        setTailPath(value, to: &parent._path![0])
    }
}

precedencegroup Link {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator ~: Link

// first part
public func ~(lhs: String, rhs: Decorator) -> Decorator {
    var copy = rhs
    copy._text = lhs
    
    return copy
}

// interim part
public func ~(lhs: Decorator, rhs: Decorator) -> Decorator {
    if rhs._text == nil {
        var copy = lhs
        copy._attributes = rhs._attributes
        return copy
    }
    else {
        var copy = rhs, lcopy = lhs
        
        if copy._path != nil {
            Decorator.setTailPath(lcopy, to: &copy._path![0])
        }
        else {
            copy._path = [lcopy]
        }
        return copy
    }
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
