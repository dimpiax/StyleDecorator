//
//  Paragraph.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation

final public class Paragraph {
    fileprivate var _paragraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle()
    
    public var raw: NSMutableParagraphStyle {
        return _paragraphStyle.mutableCopy() as! NSMutableParagraphStyle
    }
    
    public init() {}
    
    public func lineSpacing(_ value: CGFloat) -> Self {
        _paragraphStyle.lineSpacing = value
        return self
    }
    
    public func paragraphSpacing(_ value: CGFloat) -> Self {
        _paragraphStyle.paragraphSpacing = value
        return self
    }
    
    public func alignment(_ value: NSTextAlignment) -> Self {
        _paragraphStyle.alignment = value
        return self
    }
    
    public func headIndent(_ value: CGFloat) -> Self {
        _paragraphStyle.headIndent = value
        return self
    }
    
    public func tailIndent(_ value: CGFloat) -> Self {
        _paragraphStyle.tailIndent = value
        return self
    }
    
    public func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        _paragraphStyle.lineBreakMode = value
        return self
    }
    
    public func minimumLineHeight(_ value: CGFloat) -> Self {
        _paragraphStyle.minimumLineHeight = value
        return self
    }
    
    public func maximumLineHeight(_ value: CGFloat) -> Self {
        _paragraphStyle.maximumLineHeight = value
        return self
    }
    
    public func baseWritingDirection(_ value: NSWritingDirection) -> Self {
        _paragraphStyle.baseWritingDirection = value
        return self
    }
    
    public func lineHeightMultiple(_ value: CGFloat) -> Self {
        _paragraphStyle.lineHeightMultiple = value
        return self
    }
    
    public func paragraphSpacingBefore(_ value: CGFloat) -> Self {
        _paragraphStyle.paragraphSpacingBefore = value
        return self
    }
    
    public func hyphenationFactor(_ value: Float) -> Self {
        _paragraphStyle.hyphenationFactor = value
        return self
    }
    
    deinit {
        _paragraphStyle = nil
    }
}
