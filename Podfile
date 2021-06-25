platform :ios, '9.0'
use_frameworks!
target 'mosquitto-ios' do
  pod 'OpenSSL-Universal'
  # 1.0.2.20
  # 1.1.1100
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        
        if config.name == 'Release'
          config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
          else
          config.build_settings['BITCODE_GENERATION_MODE'] = 'marker'
        end
        
        cflags = config.build_settings['OTHER_CFLAGS'] || ['$(inherited)']
        
        if config.name == 'Release'
          cflags << '-fembed-bitcode'
          else
          cflags << '-fembed-bitcode-marker'
        end
        
        config.build_settings['OTHER_CFLAGS'] = cflags
      end
    end
  end
end
