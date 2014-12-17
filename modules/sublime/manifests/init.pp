# Class: sublime
#
# This module installs sublime text
#
# [Remember: No empty lines between comments and class definition]
class sublime () {
  
  apt::ppa { 'webupd8team/sublime-text-3':
  } ->
  package { 'sublime-text-installer' :
    ensure => 'installed',
  }

}