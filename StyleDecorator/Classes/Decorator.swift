//
//  Decorator.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation

/// Decorator struct served for text decoration, which accepts `Style` instance and retrieves chain of styles and string
public struct Decorator {
    fileprivate var _path: [Decorator]?
    
    fileprivate var _style: Style?
    
    // always filled, except raw decorator
    fileprivate var _text: String!
    
    /// Accepts `Style` instance
    /// - Parameter style: `Style` instance for decorating potential string in suffix concatenation
    public init(style: Style) {
        _style = style
    }
    
    /// Accepts text.
    ///
    /// Only for `fileprivate` use
    fileprivate init(text: String) {
        _text = text
    }
    
    /// Retrieves array with attributes for specific range
    public var styles: [(Style, NSRange)] {
        var location = 0
        return flatten().flatMap { value -> (Style, NSRange)? in
            let count = value._text.characters.count
            defer { location += count }
            
            guard let attributes = value._style else { return nil }
            return (attributes, NSRange(location: location, length: count))
        }
    }
    
    /// Retrieves raw string
    public var string: String {
        return flatten().map { $0._text }.reduce("", +)
    }
    
    /// Get wrapper closure
    public var wrap: (String) -> Decorator {
        return { $0 + self }
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
/// Concatenation operator
public func +(lhs: String, rhs: Decorator) -> Decorator {
    if rhs._text == nil {
        var copy = rhs
        copy._text = lhs
        return copy
    }
    else {
        return Decorator(text: lhs)+rhs
    }
}

// interim part
/// Concatenation operator
public func +(lhs: Decorator, rhs: Decorator) -> Decorator {
    if rhs._text == nil {
        var copy = lhs
        copy._style = rhs._style
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
/// Concatenation operator
public func +(lhs: Decorator, rhs: String) -> Decorator {
    var copy = lhs
    copy._text = rhs
    copy._style = nil
    
    let copy2 = lhs
    copy._path = [copy2]
    
    return copy
}
