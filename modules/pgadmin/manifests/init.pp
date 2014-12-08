# Class: pgadmin
#
# This module installs pgadmin
#
# [Remember: No empty lines between comments and class definition]
class pgadmin ($user = undef) {
  class { "postgres" : 
    user => "${user}",
  }
  package { 'pgadmin3' :
    ensure => 'installed',
  }

}