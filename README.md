# StyleDecorator

[![CI Status](http://img.shields.io/travis/Pilipenko Dima/StyleDecorator.svg?style=flat)](https://travis-ci.org/Pilipenko Dima/StyleDecorator)
[![Version](https://img.shields.io/cocoapods/v/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![License](https://img.shields.io/cocoapods/l/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)
[![Platform](https://img.shields.io/cocoapods/p/StyleDecorator.svg?style=flat)](http://cocoapods.org/pods/StyleDecorator)

Design string simply by linking attributes to needed part.
<img src=Example/StyleDecorator/Images.xcassets/thumbnail.imageset/thumbnail.png width=25% height=25% />

## Usage
Create `Decorator` with specific `Attributes` and link it at the end of needed string part:

`"Style"~d1~"Decorator"~d2~"!"`

## Example:
```swift
let a = Decorator(attributes: Attributes().foregroundColor(.black))
let b = Decorator(attributes: Attributes().foregroundColor(.white))
let c = Decorator(attributes: Attributes().foregroundColor(.gray))

let decorated = "We"~a~"Are"~b~"Pinto"~c
label.attributedText = NSAttributedString(decorator: decoratedText)
```

String can be designed dynamically:
```swift
let titleText = "We"~b~"Are"~c~"Pinto"~d
let decoratedText = "Decorate your string easy"~a~"\n\n"~titleText~"\n\n"~"Ideas"~e~"\n"~"Thinking up smart ideas"~f~"\nwith default attributes"

let defaultAttributes = Attributes()
.font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightBlack))
.alignment(.center).raw

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
