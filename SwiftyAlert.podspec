Pod::Spec.new do |s|
  s.name                = "SwiftyAlert"
  s.version             = "1.1.0"
  s.summary             = "Simple UIAlertController and UIAlertView wrapper."
  s.homepage            = "https://github.com/simorgh3196/SwiftyAlert"
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "simorgh3196" => "simorgh3196@gmail.com" }
  s.social_media_url    = "http://twitter.com/Sim_progra"
  s.platform            = :ios, "8.0"
  s.source              = { :git => "https://github.com/simorgh3196/SwiftyAlert.git", :tag => s.version }
  s.source_files        = "SwiftyAlert/**/*.swift"
  s.requires_arc = true
end
