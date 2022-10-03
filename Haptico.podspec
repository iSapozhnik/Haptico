#
# Be sure to run `pod lib lint Haptico.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Haptico'
  s.version          = '1.2.0'
  s.summary          = 'Haptico - easy to use haptic feedback generator with pattern-play support'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Haptico - easy to use haptic feedback generator with pattern-play support. Check examples for more reference.
                       DESC

  s.homepage         = 'https://github.com/isapozhnik/Haptico'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'isapozhnik' => 'sapozhnik.ivan@gmail.com' }
  s.source           = { :git => 'https://github.com/isapozhnik/Haptico.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/Haptico/**/*'
  
  # s.resource_bundles = {
  #   'Haptico' => ['Haptico/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
