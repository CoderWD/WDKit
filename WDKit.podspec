Pod::Spec.new do |s|
s.name             = "WDKit"
s.version          = "1.0.3.0"
s.summary          = "A marquee view used on iOS."
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/CoderWD/WDKit"
# s.screenshots      = ""
s.license          = 'MIT'
s.author           = { "何伟东" => "654500619@.com" }
s.source           = { :git => "https://github.com/CoderWD/WDKit.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '4.3'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

#s.source_files = 'WDKit/WDKit/*'
#s.source_files  = 'WDKit/WDKit/*.{h,m}'
s.source_files  = 'WDKit/WDKit/**/*.{h,m}'

#s.subspec 'Category' do |ss|
#ss.source_files = 'WDKit/WDKit/Category/*.{h,m}'
#end

#s.subspec 'Extension' do |ss|
#ss.source_files = 'WDKit/WDKit/Extension/*.{h,m}'
#end

#s.subspec 'Utils' do |ss|
#ss.source_files = 'WDKit/WDKit/Utils/*.{h,m}'
#end


# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'Security'

end
