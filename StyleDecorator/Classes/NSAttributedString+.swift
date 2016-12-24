//
//  NSAttributedString+.swift
//  Pods
//
//  Created by Pilipenko Dima on 12/24/16.
//
//

import Foundation
import UIKit

extension NSAttributedString {
    public convenience init?(decorator: Decorator, attributes: [String: Any]? = nil) throws {
        guard let string = decorator.string, let styles = decorator.styles else {
            throw NSError()
        }
        
        let mutable = NSMutableAttributedString(string: string, attributes: attributes)
        styles.forEach { mutable.addAttributes($0.0.raw, range: $0.1) }
        
        self.init(attributedString: mutable.copy() as! NSAttributedString)
    }
}
