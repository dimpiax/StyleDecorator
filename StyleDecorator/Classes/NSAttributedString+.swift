//
//  NSAttributedString+.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation
import UIKit

/// NSAttributedString extension for accepting `Decorator` struct and its transformation into native approach 
extension NSAttributedString {
    /**
     The NSAttributedString class convenience initializer which accepts decorater text as first parameter.
     
     - Parameter decorator: decorated text
     - Parameter attributes: native attributes
     */
    public convenience init(decorator: Decorator, attributes: [String: Any]? = nil) {
        // TODO: throw exception if decorator is wrong
        let mutable = NSMutableAttributedString(string: decorator.string, attributes: attributes)
        decorator.styles.forEach { mutable.addAttributes($0.0.attributes, range: $0.1) }
        
        self.init(attributedString: mutable.copy() as! NSAttributedString)
    }
}
