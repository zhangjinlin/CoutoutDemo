# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

# Flutter Integration
flutter_application_path = './flutter_coutout'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'CutoutDemo' do 
  use_frameworks!
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end