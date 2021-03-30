# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

@flutter_application_path = './flutter_module/shoufubei_about'

def flutter_source_project_embased_function()
  load File.join(@flutter_application_path, ‘.ios’, ‘Flutter’, ‘podhelper.rb’)
  install_all_flutter_pods(@flutter_application_path)
end



target 'MainProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  flutter_source_project_embased_function
  # Pods for MainProject

end
