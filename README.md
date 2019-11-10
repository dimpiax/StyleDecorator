# StyleDecorator

[![Language](https://img.shields.io/badge/swift-5.0-fec42e.svg)](https://swift.org/blog/swift-5-0-released/)
[![Version](https://img.shields.io/cocoapods/v/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![License](https://img.shields.io/cocoapods/l/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![Platform](https://img.shields.io/cocoapods/p/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)

Design string simply by linking attributes.

<img src=Example/StyleDecorator/Images.xcassets/thumbnail.imageset/thumbnail.png width=25% height=25% />

## Example

Create `Decorator` with specific `Style` and link it at the end of needed string or wrap for styling:

```swift
"Style" + d1 + "Decorator" + d2 + "!"
// or
d1.wrap("Style") + d2.wrap("Decorator") + "!"
```

Example:
```swift
let a = Decorator(style: Style().foregroundColor(.black).kerning(-0.5).backgroundColor(.darkGray))
let b = Decorator(style: Style().foregroundColor(.white).backgroundColor(.black))
let c = Decorator(style: Style().foregroundColor(.gray).alignment(.right))

// You can write in syntax you prefer
let decoratedText = "Bold" + a + "Heavy" + b + "Black" + c
label.attributedText = NSAttributedString(decorator: decoratedText)

// or
let a1 = a.wrap, b1 = b.wrap, c1 = c.wrap
let decoratedText2 = a1("Bold") + b1("Heavy") + c1("Black")
label.attributedText = NSAttributedString(decorator: decoratedText2)
```

String can be designed dynamically:
```swift
// check Example for detailed code, where created 'd', 'e', 'f' etc

let titleText = "! " + ("Bold" + b + "Heavy" + c + "Black" + d)
let decoratedText = "Decorate attributed string simply" + a + "\n\n" + titleText + "\n\n" + "Right" + e + "\n" + "below black rect with red line" + f + "\n\n\nwith default attributes"

let defaultAttributes = Style()
    .font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightBlack))
    .alignment(.center)
    .attributes

label.attributedText = NSAttributedString(decorator: decoratedText, attributes: defaultAttributes)
```

## Requirements

### Updated to Swift 5
#### Supports SPM

###### For Swift 4 version use [v.0.4.2](../../releases/tag/0.4.2)
###### For Swift 3.1 version use [v.0.3.0](../../releases/tag/0.3.0)

## Installation

StyleDecorator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StyleDecorator"
```

## Author

Dmytro Pylypenko, dimpiax@gmail.com

## License

StyleDecorator is available under the MIT license. See the LICENSE file for more info.

