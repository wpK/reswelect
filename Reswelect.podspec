Pod::Spec.new do |s|
  s.name             = "Reswelect"
  s.version          = "0.0.1"
  s.summary          = "A port of reselect to ReSwift."
  s.description      = <<-DESC
                          A port of reselect to ReSwift.
                        DESC
  s.homepage         = "https://github.com/wpK/reswelect"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = { "William Key" => "williamkey@@gmail.com" }
  s.social_media_url = "http://twitter.com/williamkey"
  s.source           = { :git => "https://github.com/wpK/Reswelect.git", :tag => s.version.to_s }
  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.10'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true
  s.source_files     = 'Reswelect/**/*.swift'
end
