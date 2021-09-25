
Pod::Spec.new do |s|
  s.name         = "JDCircularProgress"
  s.version      = "1.0.0"
  s.summary      = "JDCircularProgress framework"
  s.description  = <<-DESC
                  JDCircularProgress Pod can animate progress View
                   DESC
  s.homepage     = "https://github.com/jwd-ali/IOS-Portfolio"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Jawad Ali" => "L060214@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/jwd-ali/JDCircularProgress.git", :tag => "#{s.version}" }

  s.source_files = "Sources/**/*.{h,m,swift}"
  s.swift_version = "5.0"
end
