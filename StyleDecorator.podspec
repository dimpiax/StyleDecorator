Pod::Spec.new do |s|
  s.name             = 'StyleDecorator'
  s.version          = '0.1.0'
  s.summary          = 'Kindly styling of text through decorating string'
  s.description      = <<-DESC
Design string simply by linking attributes to needed part.
`"Style"~d1~"Decorator"~d2~"!"`

Example:
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

let defaultAttributes = Attributes().font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightBlack))
    .alignment(.center).raw

label.attributedText = NSAttributedString(decorator: decoratedText, attributes: defaultAttributes)
```
                       DESC

  s.homepage         = 'https://github.com/dimpiax/StyleDecorator'
  s.screenshots      = 'https://github.com/dimpiax/StyleDecorator/raw/master/thumbnail.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dima Pilipenko' => 'dimpiax@gmail.com' }
  s.source           = { :git => 'https://github.com/dimpiax/StyleDecorator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dimpiax'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StyleDecorator/Classes/**/*'
end
