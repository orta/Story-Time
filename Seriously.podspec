platform :osx
Pod::Spec.new do |s|
  s.name     = 'Seriously HTTP'
  s.version  = '1.0'
  s.license  = ''
  s.summary  = 'The Objective-C HTTP library that Apple should have created, seriously.'
  s.homepage = 'https://github.com/probablycorey/seriously'
  s.author   = { 'probablycorey' => 'cj@github.com' }

  s.source   = { :git => 'https://github.com/probablycorey/seriously.git', :tag => '1.0.0' }
  s.source_files = 'src'

  s.clean_paths = "COPYING", "scripts", "Seriously.framework", "Seriously.Seriously_Prefix"

end