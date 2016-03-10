#
# Be sure to run `pod lib lint BrightFreddy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BrightFreddy"
  s.version          = "0.1.0"
  s.summary          = "BrightFreddy merges BrightFutures and Freddy to create a seamless service layer."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "BrightFreddy merges BrightFutures and Freddy to create a seamless service layer with JSON parsing and a stable Futures and Promises implementation.  Please let me know if you want to contribute!"

  s.homepage         = "https://github.com/rplankenhorn/BrightFreddy"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Robbie Plankenhorn" => "rplankenhorn@gmail.com" }
  s.source           = { :git => "https://github.com/rplankenhorn/BrightFreddy.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.swift'
  s.resource_bundles = {
    'BrightFreddy' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'BrightFutures', '~> 3.3.0'
  s.dependency 'Freddy', '~> 2.0.2'
end
