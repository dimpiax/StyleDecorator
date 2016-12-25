//
//  Attributes.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation

final public class Attributes {    
    public fileprivate(set) var raw: [String: Any]! = [:]
    
    fileprivate var _paragraphStyle: NSMutableParagraphStyle?
    
    public init() {}
    
    public func font(_ value: UIFont) -> Self {
        raw[NSFontAttributeName] = value
        return self
    }
    
    public func paragraphStyle(_ value: NSMutableParagraphStyle) -> Self {
        _paragraphStyle = value
        raw[NSParagraphStyleAttributeName] = value
        return self
    }
    
    public func foregroundColor(_ value: UIColor?) -> Self {
        raw[NSForegroundColorAttributeName] = value
        return self
    }
    
    public func backgroundColor(_ value: UIColor?) -> Self {
        raw[NSBackgroundColorAttributeName] = value
        return self
    }
    
    public func ligature(_ value: Int) -> Self {
        raw[NSLigatureAttributeName] = value
        return self
    }
    
    public func kerning(_ value: CGFloat) -> Self {
        raw[NSKernAttributeName] = value
        return self
    }
    
    public func strikethroughStyle(_ value: Int) -> Self {
        raw[NSStrikethroughStyleAttributeName] = value
        return self
    }
    
    public func underlineStyle(_ value: Int) -> Self {
        raw[NSUnderlineStyleAttributeName] = value
        return self
    }
    
    public func strokeColor(_ value: UIColor?) -> Self {
        raw[NSStrokeColorAttributeName] = value
        return self
    }
    
    public func strokeWidth(_ value: CGFloat) -> Self {
        raw[NSStrokeWidthAttributeName] = value
        return self
    }
    
    public func shadow(_ value: NSShadow?) -> Self {
        raw[NSStrokeWidthAttributeName] = value
        return self
    }
    
    public func textEffect(_ value: String?) -> Self {
        raw[NSTextEffectAttributeName] = value
        return self
    }
    
    public func attachment(_ value: NSTextAttachment?) -> Self {
        raw[NSAttachmentAttributeName] = value
        return self
    }
    
    public func link(_ value: URL?) -> Self {
        raw[NSLinkAttributeName] = value
        return self
    }
    
    public func baselineOffset(_ value: CGFloat) -> Self {
        raw[NSBaselineOffsetAttributeName] = value
        return self
    }
    
    public func underlineColor(_ value: UIColor?) -> Self {
        raw[NSUnderlineColorAttributeName] = value
        return self
    }
    
    public func strikethroughColor(_ value: UIColor?) -> Self {
        raw[NSStrikethroughColorAttributeName] = value
        return self
    }
    
    public func obliqueness(_ value: CGFloat) -> Self {
        raw[NSObliquenessAttributeName] = value
        return self
    }
    
    public func expansion(_ value: CGFloat) -> Self {
        raw[NSExpansionAttributeName] = value
        return self
    }
    
    // ???
    /*public func writingDirection(_ value: [CGFloat]) -> Self {
     raw[NSWritingDirectionAttributeName] = value
     return self
     }*/
    
    public func verticalGlyphForm(_ value: Int) -> Self {
        raw[NSVerticalGlyphFormAttributeName] = value
        return self
    }
    
    // composed
    public func alignment(_ value: NSTextAlignment) -> Self {
        if _paragraphStyle == nil { _paragraphStyle = NSMutableParagraphStyle() }
        raw[NSParagraphStyleAttributeName] = _paragraphStyle!
        
        _paragraphStyle!.alignment = value
        return self
    }
    
    deinit {
        raw = nil
        _paragraphStyle = nil
    }
}
