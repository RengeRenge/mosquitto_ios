
Pod::Spec.new do |s|
  s.name             = 'mosquitto_ios'
  s.version          = '2.0.11.1'
  s.summary          = 'Publish to CocoaPods.'
  s.description      = <<-DESC
Eclipse Mosquitto - An open source MQTT broker
                       DESC

  s.homepage         = 'https://github.com/RengeRenge/mosquitto_ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Renge' => 'lidrkuft123@163.com' }
  s.source           = { :git => 'https://github.com/RengeRenge/mosquitto_ios.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '9.0'
  
  s.xcconfig = {
    "GCC_PREPROCESSOR_DEFINITIONS" => 'WITH_TLS=1'
  }
  
  s.source_files =
  'package/mosquitto_ios.h',
  'package/mosquitto/config.h',
  'package/mosquitto/deps/**/*.{h,c,cpp}',
  'package/mosquitto/include/**/*.{h,c,cpp}',
  'package/mosquitto/lib/**/*.{h,c,cpp}',
  
  'mosquitto_ios.h',
  'mosquitto/config.h',
  'mosquitto/deps/**/*.{h,c,cpp}',
  'mosquitto/include/**/*.{h,c,cpp}',
  'mosquitto/lib/**/*.{h,c,cpp}'
  
  s.public_header_files =
  'package/mosquitto_ios.h',
  'package/mosquitto/config.h',
  'package/mosquitto/include/mosquitto.h',
  'mosquitto_ios.h',
  'mosquitto/config.h',
  'mosquitto/include/mosquitto.h'
  
  s.dependency 'OpenSSL-Universal'
  s.dependency 'CocoaSecurity'
end
