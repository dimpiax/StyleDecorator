//
//  ViewController.swift
//  StyleDecorator
//
//  Created by Pilipenko Dima on 12/24/2016.
//  Copyright (c) 2016 Pilipenko Dima. All rights reserved.
//

import UIKit
import StyleDecorator

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.numberOfLines = 0
        view.addSubview(label)
        
        // 1. simple styling example
        let attributedStyle = Attributes()
            .font(UIFont.systemFont(ofSize: 21, weight: UIFontWeightLight))
            .alignment(.center)
        
        let _ = NSAttributedString(string: "Attribute it!", attributes: attributedStyle.foregroundColor(.gray).raw)
        
        // 2. easy styling
        let defaultAttributes = Attributes()
            .font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightBlack))
            .alignment(.center).raw
        
        // setup decorators
        let a = Decorator(attributes: Attributes().foregroundColor(.white).backgroundColor(.black).font(UIFont.systemFont(ofSize: 13, weight: UIFontWeightBold)))
        
        let b = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 23, weight: UIFontWeightMedium)).paragraphStyle(Paragraph().paragraphSpacing(10).hyphenationFactor(1).alignment(.right).raw))
        
        let c = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 27, weight: UIFontWeightHeavy)).alignment(.right))
        
        let d = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)).alignment(.right).kerning(-0.5))
        
        let e = Decorator(attributes:
            Attributes()
                .foregroundColor(.white)
                .backgroundColor(.black)
                .font(UIFont.systemFont(ofSize: 17, weight: UIFontWeightBold))
                .underlineStyle(2)
                //.baselineOffset(17)
                .underlineColor(.red)
                .paragraphStyle(Paragraph()
                    .alignment(.right)
                    //.lineSpacing(5)
                    .raw
            )
        )
        
        let f = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 21, weight: UIFontWeightThin)).kerning(-0.5).backgroundColor(.darkGray).foregroundColor(.white).paragraphStyle(Paragraph().lineSpacing(5).alignment(.center).raw))
        
        let decoratedText = "Decorate your string easy"~f~"\n\n"~"We"~a~"Are"~b~"Pinto"~c~"\n\n"~"Ideas"~e~"\n"~"Thinking up smart ideas"~d
        label.attributedText = try! NSAttributedString(decorator: decoratedText, attributes: defaultAttributes)
        
        // layout
        let views: [String: UIView] = ["label": label]
        views.forEach { $0.value.translatesAutoresizingMaskIntoConstraints = false }
        
        var layout = [NSLayoutConstraint]()
        layout += NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: views)
        layout += NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(layout)
    }
}

