Pod::Spec.new do |spec|
  spec.name         = 'DeviceAdvertiser'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors      = 'Malik Alayli'
  spec.summary      = 'DeviceAdvertiser Framework for iOS'
  spec.source_files = 'DeviceAdvertiser/*.swift'
  spec.framework    = 'Foundation'
  spec.homepage     = 'https://github.com/malayli/ios-device-advertiser'
  spec.source       = { :git => 'https://github.com/malayli/ios-device-advertiser.git' }
end
