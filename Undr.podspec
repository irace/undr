Pod::Spec.new do |s|
  s.name         = 'Undr'
  s.version      = '0.1.0'
  s.summary      = 'Objective-C functional utitlity-belt with an Underscore.js compatible API'
  s.author       = { 'Bryan Irace' => 'bryan@irace.me' }
  s.license      = 'MIT'
  s.source_files = 'Undr'
  s.requires_arc = true
  s.osx.deployment_target = '10.7'
  s.ios.deployment_target = '5.0'
  s.frameworks   = 'Foundation'
end
