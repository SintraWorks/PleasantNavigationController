Pod::Spec.new do |s|

  s.name         = "PleasantNavigationController"
  s.version      = "0.1"
  s.summary      = "A navigation controller that does a better job at communicating navigation events."

  s.description  = <<-DESC
  A UINavigationController will only tell you when it shows a new top view controller via a push, pop or setting of the view controller stack. You never know the type/direction of the move. This subclass of UINavigationController, communicates its navigation actions to its delegate with a more fine-grained approach.
                   DESC

  s.homepage     = "https://sintraworks.github.io/swift/uikit/2018/11/01/a-better-navigation-controller.html"

  s.license      = { :type => "MIT", :file => "PleasantNavigationController/LICENSE" }

  s.author             = { "Antonio Nunes" => "info@sintraworks.com" }
  s.social_media_url   = "http://twitter.com/SintraWorks"

  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/SintraWorks/PleasantNavigationController.git", :tag => "#{s.version}" }

  s.source_files  = "PleasantNavigationController/PleasantNavigationController/*.{swift}"
  s.swift_version = "5.0"
  s.requires_arc = true

end
