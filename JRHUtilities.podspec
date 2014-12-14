Pod::Spec.new do |s|
  s.name             = "JRHUtilities"
  s.version          = "0.1.0"
  s.summary          = "Personal iOS utilities"
  s.homepage         = "https://github.com/jayhickey/JRHUtilities"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Jay Hickey" => "johnrhickey@gmail.com" }
  s.source           = { :git => "https://github.com/jayhickey/JRHUtilities.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jayhickey'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'JRHUtilities/*.{h,m}'
end
