Pod::Spec.new do |s|
  s.name             = 'StyleDecorator'
  s.version          = '0.1.0'
  s.summary          = 'A short description of StyleDecorator.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dimpiax/StyleDecorator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dima Pilipenko' => 'dimpiax@gmail.com' }
  s.source           = { :git => 'https://github.com/dimpiax/StyleDecorator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dimpiax'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StyleDecorator/Classes/**/*'
end
