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
        let attributedStyle = Style()
            .font(UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.light))
            .alignment(.center)
        
        let _ = NSAttributedString(string: "Attribute it!", attributes: attributedStyle.foregroundColor(.gray).attributes)
        
        // 2. easy styling
        let defaultAttributes = Style()
            .font(UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.black))
            .alignment(.center).attributes
        
        // setup decorators
        let a = Decorator(style: Style().font(UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.thin)).kerning(-0.5).backgroundColor(.darkGray).foregroundColor(.white).paragraphStyle(Paragraph().lineSpacing(5).alignment(.center).raw))
        
        let b = Decorator(style: Style().foregroundColor(.white).backgroundColor(.black).font(UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)))
        
        let c = Decorator(style: Style().font(UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium)).paragraphStyle(Paragraph().paragraphSpacing(10).hyphenationFactor(1).alignment(.right).raw))
        
        let d = Decorator(style: Style().font(UIFont.systemFont(ofSize: 27, weight: UIFont.Weight.heavy)).alignment(.right))
        
        let f = Decorator(style: Style().font(UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)).alignment(.right).kerning(-0.5))
        
        let e = Decorator(style:
            Style()
                .foregroundColor(.white)
                .backgroundColor(.black)
                .font(UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold))
                .underlineStyle(2)
                //.baselineOffset(17)
                .underlineColor(.red)
                .paragraphStyle(Paragraph()
                    .alignment(.right)
                    .lineSpacing(17)
                    .raw
            )
        )
        
        // You can write in syntax you prefer
        // case 1
        let part = "We" + b + "Are" + c + "Pinto" + d
        let titleText = "! " + part
        var decoratedText = "Decorate your string easy" + a
            decoratedText = decoratedText + "\n\n" + titleText
            decoratedText = decoratedText + "\n\n" + "Ideas"
            decoratedText = decoratedText + e + "\n" + "Thinking up smart ideas"
            decoratedText = decoratedText + f + "\n\n\nwith default attributes"
        
        label.attributedText = NSAttributedString(decorator: decoratedText, attributes: defaultAttributes)
        
        // case 2
        let a1 = a.wrap, b1 = b.wrap, c1 = c.wrap, d1 = d.wrap, e1 = e.wrap, f1 = f.wrap
        let titleText2 = "! " + b1("We") + c1("Are") + d1("Pinto")
        let partA1 = a1("Decorate your string easy")
        let partE1 = e1("Ideas")
        let partF1 = f1("Thinking up smart ideas")
        var decoratedText2 = partA1 + "\n\n"
            decoratedText2 = decoratedText2 + titleText2 + "\n\n"
            decoratedText2 = decoratedText2 + partE1
            decoratedText2 = decoratedText2 + "\n" + partF1
            decoratedText2 = decoratedText2 + "\n\n\nwith default attributes"
        label.attributedText = NSAttributedString(decorator: decoratedText2, attributes: defaultAttributes)

        // layout
        let views = ["label": label]
        views.forEach { $0.value.translatesAutoresizingMaskIntoConstraints = false }

        var layout = [NSLayoutConstraint]()
        layout += NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: views)
        layout += NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(layout)
    }
}

