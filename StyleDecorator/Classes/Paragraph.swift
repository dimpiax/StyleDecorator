//
//  Paragraph.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation
import UIKit

/// D
final public class Paragraph {
    fileprivate var _paragraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle()
    
    /// Safe-copied paragraph style
    public var raw: NSMutableParagraphStyle {
        return _paragraphStyle.mutableCopy() as! NSMutableParagraphStyle
    }
    
    /// Empty initializer
    public init() {}
    
    /**
     The distance in points between the bottom of one line fragment and the top of the next.
     
     This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
     */
    public func lineSpacing(_ value: CGFloat) -> Self {
        _paragraphStyle.lineSpacing = value
        return self
    }
    
    /**
     The distance in points between the bottom of one line fragment and the top of the next.
     
     This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
     */
    public func paragraphSpacing(_ value: CGFloat) -> Self {
        _paragraphStyle.paragraphSpacing = value
        return self
    }
    
    /**
     The distance in points between the bottom of one line fragment and the top of the next.
     
     This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
     */
    public func alignment(_ value: NSTextAlignment) -> Self {
        _paragraphStyle.alignment = value
        return self
    }
    
    /**
     The indentation of the receiver’s lines other than the first.
     
     This property contains the distance (in points) from the leading margin of a text container to the beginning of lines other than the first. This value is always nonnegative.
     */
    public func headIndent(_ value: CGFloat) -> Self {
        _paragraphStyle.headIndent = value
        return self
    }
    
    /**
     The trailing indentation of the receiver.
     
     If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text). If 0 or negative, it’s the distance from the trailing margin.
     
     For example, a paragraph style designed to fit exactly in a 2-inch wide container has a head indent of 0.0 and a tail indent of 0.0. One designed to fit with a quarter-inch margin has a head indent of 0.25 and a tail indent of –0.25.
     */
    public func tailIndent(_ value: CGFloat) -> Self {
        _paragraphStyle.tailIndent = value
        return self
    }
    
    /**
     The mode that should be used to break lines in the receiver.
     Possible cases:
     
     * byWordWrapping
     * byCharWrapping
     * byClipping
     * byTruncatingHead
     * byTruncatingTail
     * byTruncatingMiddle
     
     If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text). If 0 or negative, it’s the distance from the trailing margin.
     
     For example, a paragraph style designed to fit exactly in a 2-inch wide container has a head indent of 0.0 and a tail indent of 0.0. One designed to fit with a quarter-inch margin has a head indent of 0.25 and a tail indent of –0.25.
     */
    public func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        _paragraphStyle.lineBreakMode = value
        return self
    }
    
    /**
     The receiver’s minimum height.
     
     This property contains the minimum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value must be nonnegative.
     */
    public func minimumLineHeight(_ value: CGFloat) -> Self {
        _paragraphStyle.minimumLineHeight = value
        return self
    }
    
    /**
     The receiver’s maximum line height.
     
     This property contains the maximum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value is always nonnegative. The default value is 0.
     
     Glyphs and graphics exceeding this height will overlap neighboring lines; however, a maximum height of 0 implies no line height limit. Although this limit applies to the line itself, line spacing adds extra space between adjacent lines.
     */
    public func maximumLineHeight(_ value: CGFloat) -> Self {
        _paragraphStyle.maximumLineHeight = value
        return self
    }
    
    /**
     The base writing direction for the receiver.
     
     If you specify `NSWritingDirectionNaturalDirection`, the receiver resolves the writing direction to either `NSWritingDirectionLeftToRight` or `NSWritingDirectionRightToLeft`, depending on the direction for the user’s language preference setting.
     */
    public func baseWritingDirection(_ value: NSWritingDirection) -> Self {
        _paragraphStyle.baseWritingDirection = value
        return self
    }
    
    /**
     The line height multiple.
     
     The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. The default value of this property is 0.0.
     */
    public func lineHeightMultiple(_ value: CGFloat) -> Self {
        _paragraphStyle.lineHeightMultiple = value
        return self
    }
    
    /**
     The distance between the paragraph’s top and the beginning of its text content.
     
     This property contains the space (measured in points) between the paragraph’s top and the beginning of its text content. The default value of this property is 0.0.
     */
    public func paragraphSpacingBefore(_ value: CGFloat) -> Self {
        _paragraphStyle.paragraphSpacingBefore = value
        return self
    }
    
    /**
     The paragraph’s threshold for hyphenation.
     
     Valid values lie between 0.0 and 1.0 inclusive. The default value is 0.0. Hyphenation is attempted when the ratio of the text width (as broken without hyphenation) to the width of the line fragment is less than the hyphenation factor. When the paragraph’s hyphenation factor is 0.0, the layout manager’s hyphenation factor is used instead. When both are 0.0, hyphenation is disabled.
     */
    public func hyphenationFactor(_ value: Float) -> Self {
        _paragraphStyle.hyphenationFactor = value
        return self
    }
    
    deinit {
        _paragraphStyle = nil
    }
}
