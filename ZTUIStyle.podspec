Pod::Spec.new do |spec|

  spec.name         = "ZTUIStyle"
  spec.version      = "0.0.1"
  spec.summary      = "An easy way to make a beautiful UI style"
  spec.homepage     = "https://github.com/RuffianZhong/ZTUIStyle"
  spec.license      = "MIT"
  spec.author       = { "Ruffian" => "632835821@qq.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/RuffianZhong/ZTUIStyle.git", :tag => spec.version }
  spec.source_files  = "ZTUIStyle", "ZTUIStyle/framework/**/*.{h,m}"
  spec.requires_arc = true
  
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
