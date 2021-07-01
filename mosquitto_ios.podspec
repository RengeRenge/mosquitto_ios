
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
  s.source           = { :git => 'https://github.com/RengeRenge/mosquitto_ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.vendored_frameworks = 'mosquitto_ios.xcframework'

  s.dependency 'OpenSSL-Universal'
  s.dependency 'CocoaSecurity'
end
