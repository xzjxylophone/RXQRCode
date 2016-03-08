









Pod::Spec.new do |s|
  s.name     = "RXQRCode"
  s.version  = "0.2"
  s.license  = "MIT"
  s.summary  = "RXQRCode is a simple”
  s.homepage = "https://github.com/xzjxylophone/RXQRCode"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXQRCode.git', :tag => "v#{s.version}" }
  s.description = %{
    RXQRCode is a simple.
  }
  s.source_files = 'RXQRCode/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '7.0'
  s.dependency 'libqrencode'
end






