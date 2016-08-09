# Class: demo
#
# [Remember: No empty lines between comments and class definition]
class demo ( $user = undef) {
  class { 'linux-base':
    user => "${user}",
  }
  class { 'docker': }

  class { "pgadmin" :
    user => "${user}",
  }

 }