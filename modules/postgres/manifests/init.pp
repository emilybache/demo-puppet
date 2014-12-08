# Class: postgres
#
# This module manages postgres and configuration
#
# [Remember: No empty lines between comments and class definition]
class postgres ($user = undef, $version = "9.3") {
  $postgres_package         = [ "postgresql-contrib-${version}", ]
  
  apt::source { 'pgdg':
    location    => 'http://apt.postgresql.org/pub/repos/apt/',
    release     => "${lsbdistcodename}-pgdg",
    repos       => 'main',
    include_src => false,
    key         => 'ACCC4CF8',
    key_content => template("${module_name}/pgdg.pub.key.erb")
  } ->
  package { $postgres_package :
    ensure => 'installed',
  } ->
  service { "postgresql":
    enable => false,
    ensure => "stopped",
  }

  file { "/home/${user}/.pgpass":
    ensure => file,
    mode => 0600,
    owner => "${user}",
    group => "${user}",
    source  => "puppet:///modules/${module_name}/.pgpass",
    require => User ["${user}"],
  }

}

