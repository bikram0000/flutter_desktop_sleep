#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_desktop_sleep.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_desktop_sleep'
  s.version          = '0.0.1'
  s.summary          = 'A plugin for detect sleep and wake up of MacOs and Windows'
  s.description      = <<-DESC
A plugin for detect sleep and wake up of MacOs and Windows
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
