//
//  Style.swift
//  StyleDecorator
//
//  Created by Dmytro Pylypenko on 11/10/19.
//

import Foundation
import UIKit

/// Style class for easy text view attributes setup
final public class Style {
  /// Dictionary with native attributes
  public fileprivate(set) var attributes: [NSAttributedString.Key: Any]! = [:]
  
  fileprivate var _paragraphStyle: NSMutableParagraphStyle?
  
  /// Empty initializer
  public init() {}
  
  /**
   Set font. If you do not specify this attribute, the string uses a 12-point Helvetica(Neue) font by default.
   
   - Parameter value: exist font. Example: UIFont.systemFont(ofSize: 17)
   */
  public func font(_ value: UIFont) -> Self {
    attributes[.font] = value
    return self
  }
  
  /**
   The value of this attribute is an NSParagraphStyle object.
   */
  public func paragraphStyle(_ value: NSMutableParagraphStyle) -> Self {
    _paragraphStyle = value
    attributes[.paragraphStyle] = value
    return self
  }
  
  /**
   The value of this attribute is a UIColor object. Use this attribute to specify the color of the text during rendering. If you do not specify this attribute, the text is rendered in black.
   */
  public func foregroundColor(_ value: UIColor?) -> Self {
    attributes[.foregroundColor] = value
    return self
  }
  
  /**
   The value of this attribute is a UIColor object. Use this attribute to specify the color of the background area behind the text. If you do not specify this attribute, no background color is dattributesn.
   */
  public func backgroundColor(_ value: UIColor?) -> Self {
    attributes[.backgroundColor] = value
    return self
  }
  
  /**
   Set ligature
   
   - Parameter value: ligature style. default is 1 – default ligatures, 0 – no ligatures
   */
  public func ligature(_ value: Int) -> Self {
    attributes[.ligature] = value
    return self
  }
  
  /**
   Set kerning
   
   - Parameter value: in points; amount to modify default kerning. 0 means kerning is disabled.
   */
  public func kerning(_ value: CGFloat) -> Self {
    attributes[.kern] = value
    return self
  }
  
  /**
   Set strikethrough
   
   - Parameter value: strikethrough style. 0 – no strikethrough
   */
  public func strikethroughStyle(_ value: Int) -> Self {
    attributes[.strikethroughStyle] = value
    return self
  }
  
  /**
   Set underline style
   
   - Parameter value: underline style. 0 – no underline
   */
  public func underlineStyle(_ value: Int) -> Self {
    attributes[.underlineStyle] = value
    return self
  }
  
  /**
   Set stroke color
   
   - Parameter value: stroke color
   */
  public func strokeColor(_ value: UIColor?) -> Self {
    attributes[.strokeColor] = value
    return self
  }
  
  /**
   Set stroke width
   
   - Parameter value: in percent of font point size. 0 – no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
   */
  public func strokeWidth(_ value: CGFloat) -> Self {
    attributes[.strokeWidth] = value
    return self
  }
  
  /**
   Set shadow
   
   - Parameter value: shadow text
   */
  public func shadow(_ value: NSShadow?) -> Self {
    attributes[.shadow] = value
    return self
  }
  
  /**
   Set text effect
   
   - Parameter value: text effect
   */
  public func textEffect(_ value: String?) -> Self {
    attributes[.textEffect] = value
    return self
  }
  
  /**
   Set attachment
   
   - Parameter value: attachment in text
   */
  public func attachment(_ value: NSTextAttachment?) -> Self {
    attributes[.attachment] = value
    return self
  }
  
  /**
   Set link
   
   - Parameter value: URL for link
   */
  public func link(_ value: URL?) -> Self {
    attributes[.link] = value
    return self
  }
  
  /**
   Set baseline offset
   
   - Parameter value: offset from baseline in points
   */
  public func baselineOffset(_ value: CGFloat) -> Self {
    attributes[.baselineOffset] = value
    return self
  }
  
  /**
   Set underline color
   
   - Parameter value: underline color
   */
  public func underlineColor(_ value: UIColor?) -> Self {
    attributes[.underlineColor] = value
    return self
  }
  
  /**
   Set strikethrough color
   
   - Parameter value: strikethrough color
   */
  public func strikethroughColor(_ value: UIColor?) -> Self {
    attributes[.strikethroughColor] = value
    return self
  }
  
  /**
   Set obliqueness
   
   - Parameter value: skew to be applied to glyphs
   */
  public func obliqueness(_ value: CGFloat) -> Self {
    attributes[.obliqueness] = value
    return self
  }
  
  /**
   Set expansion factor
   
   - Parameter value: expansion factor to be applied to glyphs. 0 – no expansion
   */
  public func expansion(_ value: CGFloat) -> Self {
    attributes[.expansion] = value
    return self
  }
  
  // ???
  /*public func writingDirection(_ value: [CGFloat]) -> Self {
   attributes[NSWritingDirectionAttributeName] = value
   return self
   }*/
  
  /**
   Set vertical glyph form
   - Parameter value: The value 0 indicates horizontal text. The value 1 indicates vertical text.
   */
  public func verticalGlyphForm(_ value: Int) -> Self {
    attributes[.verticalGlyphForm] = value
    return self
  }
  
  /**
   Set text alignment, it can be one of:
   
   * left
   * center
   * right
   * justified
   * natural
   
   It will overwrite your custom paragraph which has been set in `paragraphStyle` method
   
   - Parameter value: text alignment enum
   - Returns: Same Attributes instance for chain calling
   */
  public func alignment(_ value: NSTextAlignment) -> Self {
    let p = NSMutableParagraphStyle()
    p.alignment = value
    
    return paragraphStyle(p)
  }
  
  deinit {
    attributes = nil
    _paragraphStyle = nil
  }
}
