Pod::Spec.new do |spec|
  spec.name         = 'JFFileManager'
  spec.version      = '1.0.0'
  spec.license = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  spec.homepage     = 'https://github.com/mergesort/JFFileManager'
  spec.authors      =  'Joe Fabisevich' => 'github@fabisevi.ch'
  spec.summary      = 'Class methods which make dealing with files on iOS easier.'
  spec.source       =  :git => 'https://github.com/mergesort/JFFileManager.git', :tag => 'v1.0.0'
  spec.source_files = 'JFFileManager.h,m'
  spec.framework    = 'Foundation'
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/mergesort'
  s.ios.deployment_target = '5.0'
end
