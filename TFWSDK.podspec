Pod::Spec.new do |spec|

  spec.name         = "TFWSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of TFWSDK."

  
  spec.description  = <<-DESC
	是这个测试sdk的描述，先随便写一点吧，以后想好了再来写。
                   DESC

  spec.homepage     = "https://github.com/zwj222/TFWDemo"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Willian" => "1741831606@qq.com" }
  # spec.authors            = { "Willian" => "1741831606@qq.com" }
  # spec.social_media_url   = "https://twitter.com/Willian"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.platform     = :ios, "10.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "10.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/zwj222/TFWDemo.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "TFWSDK/TFWSDK/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "TFWSDK/TFWSDK/TFWSDK.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  spec.resources = "TFWSDK/TFWSDK/TFWSDK.bundle"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #spec.framework  = "UIKit", "Founcation"
  spec.frameworks = "UIKit", "Founcation"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.requires_arc = true

  spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
