Pod::Spec.new do |s|
  s.name         = "AutoLayoutShorthand"
  s.version      = "0.0.1"
  s.summary      = "AutoLayoutShorthand."
  s.description  = <<-DESC
      Auto Layout Shorthand
      Auto Layout Shorthand (ALS) is an alternative system for creating and adding Auto Layout constraints.
  DESC
  s.homepage     = "https://github.com/rentzsch/AutoLayoutShorthand"

  s.license      = { :type => 'MIT', :text => <<-DESC
      Copyright (c) 2013 Jonathan 'Wolf' Rentzsch: http://rentzsch.com. 
      Some rights reserved: http://opensource.org/licenses/mit.
  DESC
                    }

  s.author       = { "Jonathan 'Wolf' Rentzsch" => "rentzsch" }

  s.resources    = ''
  s.source       = { :git => "https://github.com/rentzsch/AutoLayoutShorthand.git", :commit => "3be3a6ee2f9928349c914a9cff238429f68dba5c" }

  s.platform     = :ios, '6.0'

  s.source_files = '*.{h,m}'

  s.public_header_files = '*.h'

  s.requires_arc = true

end
