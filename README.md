# StyleDecorator

[![Language](https://img.shields.io/badge/swift-3.0-fec42e.svg)](https://swift.org/blog/swift-3-0-released/)
[![CI Status](http://img.shields.io/travis/dimpiax/StyleDecorator.svg?style=flat)](https://travis-ci.org/dimpiax/StyleDecorator)
[![Version](https://img.shields.io/cocoapods/v/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![License](https://img.shields.io/cocoapods/l/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![Platform](https://img.shields.io/cocoapods/p/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)

Design string simply by linking attributes to needed part.

<img src=Example/StyleDecorator/Images.xcassets/thumbnail.imageset/thumbnail.png width=25% height=25% />

## Usage
Create `Decorator` with specific `Style` and link it at the end of needed string part:

`"Style"~d1~"Decorator"~d2~"!"`

## Example:
```swift
let a = Decorator(style: Style().foregroundColor(.black))
let b = Decorator(style: Style().foregroundColor(.white))
let c = Decorator(style: Style().foregroundColor(.gray))

let decoratedText = "We"~a~"Are"~b~"Pinto"~c
label.attributedText = NSAttributedString(decorator: decoratedText)
```

String can be designed dynamically:
```swift
let titleText = "! "~("We"~b~"Are"~c~"Pinto"~d)
let decoratedText = "Decorate your string easy"~a~"\n\n"~titleText~"\n\n"~"Ideas"~e~"\n"~"Thinking up smart ideas"~f~"\n\n\nwith default attributes"

let defaultAttributes = Style().font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightBlack))
.alignment(.center).attributes

label.attributedText = NSAttributedString(decorator: decoratedText, attributes: defaultAttributes)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

StyleDecorator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StyleDecorator"
```

## Author

Pilipenko Dima, dimpiax@gmail.com

## License

StyleDecorator is available under the MIT license. See the LICENSE file for more info.
