Pod::Spec.new do |s|
  s.name             = 'StyleDecorator'
  s.version          = '0.2.2'
  s.summary          = 'Kindly styling of text through decorating string'
  s.description      = <<-DESC
Design string simply by linking attributes to needed part.
`"Style"~d1~"Decorator"~d2~"!"`

Example:
```swift
let a = Decorator(style: Style().foregroundColor(.black))
let b = Decorator(style: Style().foregroundColor(.white))
let c = Decorator(style: Style().foregroundColor(.gray))

let decorated = "We"~a~"Are"~b~"Pinto"~c
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
                       DESC

  s.homepage         = 'https://github.com/dimpiax/StyleDecorator'
  s.screenshots      = 'https://github.com/dimpiax/StyleDecorator/raw/master/Example/StyleDecorator/Images.xcassets/thumbnail.imageset/thumbnail.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dima Pilipenko' => 'dimpiax@gmail.com' }
  s.source           = { :git => 'https://github.com/dimpiax/StyleDecorator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dimpiax'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StyleDecorator/Classes/**/*'
end
