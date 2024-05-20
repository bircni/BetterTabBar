Pod::Spec.new do |spec|
  spec.name                       = "BetterTabBar"
  spec.version                    = "0.1.0"
  spec.summary                    = "A beautiful and customizable tab bar for iOS."
  spec.homepage                   = "https://github.com/bircni/BetterTabBar"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { "Nicolas" => "bircni@icloud.com" }
  spec.source                     = { :git => 'https://github.com/bircni/BetterTabBar.git', :tag => spec.version.to_s }
  spec.ios.deployment_target      = '15.0'
  spec.osx.deployment_target      = "12"
  spec.swift_version              = '5.7'
  spec.source_files               = "Sources/**/*.{h,m,swift}"
end
