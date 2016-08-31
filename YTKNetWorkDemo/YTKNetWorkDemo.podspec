Pod::Spec.new do |s|
  s.name         = 'YTKNetWorkDemo'
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/liuzewen/YTKNetWrokUseingDemo'
  s.authors      = 'liuzewen': 's1224w106@gmail.com'
  s.summary      = 'ytknetwork demo'

  s.platform     =  :ios, '7.0'
  s.source       =  git: 'https://github.com/liuzewen/YTKNetWrokUseingDemo.git', :tag => s.version
  s.source_files = 'YTKNetWorkDemo/**/*.{h,m}'
  s.frameworks   =  'UIKit'
  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod  "Masonry"
  s.dependencies =	pod  "YTKNetwork"
  s.dependencies =	pod  "ZFPlayer"

end