# Class: docker-demo
#
# [Remember: No empty lines between comments and class definition]
class docker-demo ( $user = undef) {
  class { 'linux-base':
    user => "${user}",
  }
  class { 'docker': }

  class { "pgadmin" :
    user => "${user}",
  }

 }