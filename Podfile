# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'FinalProj' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FinalProj
    pod 'Cosmos','~>21'
    pod 'TinyConstraints'
    

  target 'FinalProjTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FinalProjUITests' do
    # Pods for testing
  end
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

end
