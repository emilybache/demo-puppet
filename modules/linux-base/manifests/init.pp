# Class: linux-base
#
# [Remember: No empty lines between comments and class definition]
class linux-base ( $user = undef) {

  if $user == undef {
    fail "No user defined"
  }
  @user { "${user}":
    ensure     => present,
    managehome => true,
    shell      => '/bin/bash',
  }

  User <| title == "${user}" |>

  include '::apt'

  $base_packages = [
    'vim',
    'git-core',
    'openssh-server',
    'augeas-tools',
    'curl',
  ]

  package { $base_packages:
    ensure => 'installed'
  }

  exec { "locale_sv_SE":
    command => "localedef -i sv_SE -c -f UTF-8 sv_SE.UTF-8",
    onlyif => [ "test $(locale -a | grep 'sv_SE\\.utf8' | wc -l) -eq 0" ],
    path => "/usr/bin:/bin"
  }

  class { 'wget': }

  file { "/home/${user}/tools/":
    ensure => directory,
    require => User["$user"],
    owner => "$user",
    group => "$user"
  }

  class {'python-tools':
    require => [ User["$user"] ],
  }

}

