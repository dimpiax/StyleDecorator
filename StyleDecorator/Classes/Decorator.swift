//
//  Decorator.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation

// 0: [D, D, D, D], D
// 1: [D([D([D([])])])]

public struct Decorator {
    fileprivate var _path: [Decorator]?
    
    fileprivate var _attributes: Attributes?
    
    // always filled
    fileprivate var _text: String!
    
    public init(attributes: Attributes) {
        _attributes = attributes
    }
    
    public var styles: [(Attributes, NSRange)]? {
        guard var path = _path else { return nil }
        
        var location = 0
        if _attributes == nil {
            path.removeLast()
        }
        return path.map { value -> (Attributes, NSRange)? in
            let count = value._text.characters.count
            defer { location += count }
            
            guard let attributes = value._attributes else { return nil }
            return (attributes, NSRange(location: location, length: count))
            }
            .flatMap { $0 }
    }
    
    public var string: String? {
        guard var path = _path else { return nil }
        return path.map { $0._text }.reduce("", +)
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
    
    var cleanCopy = copy
    cleanCopy._path = nil
    
    if copy._path == nil { copy._path = [] }
    copy._path!.append(cleanCopy)
    
    return copy
}

// interim part
public func ~(lhs: Decorator, rhs: Decorator) -> Decorator {
    var copy: Decorator!
    
    if rhs._path != nil {
        var copy = rhs
        copy._text = lhs._text
        copy._path = lhs._path
        copy._attributes = lhs._attributes
        
        copy._path?.removeLast()
        
        // put last inside
        var cleanCopy = copy
        cleanCopy._path = nil
        copy._path!.append(cleanCopy)
        
        // merge
        copy._path!.append(contentsOf: rhs._path!)
        
        // TODO: check is have attributes
        copy._attributes = rhs._attributes
        copy._text = rhs._text
        
        return copy
    }
    else {
        var copy = rhs
        copy._text = lhs._text
        copy._path = lhs._path
        
        var cleanCopy = copy
        cleanCopy._path = nil
        
        copy._path?.removeLast()
        
        
        if copy._path == nil { copy._path = [] }
        copy._path!.append(cleanCopy)
        
        // in case, rhs is string
        if rhs._text != nil {
            copy._attributes = rhs._attributes
            copy._text = rhs._text
        }
        
        return copy
    }
}

// last part
public func ~(lhs: Decorator, rhs: String) -> Decorator {
    var copy = lhs
    
    copy._text = rhs
    copy._attributes = nil
    
    var cleanCopy = copy
    cleanCopy._path = nil
    
    if copy._path == nil { copy._path = [] }
    copy._path!.append(cleanCopy)
    
    return copy
}
