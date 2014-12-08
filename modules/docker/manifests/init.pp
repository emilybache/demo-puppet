# Class:docker
#
#
# [Remember: No empty lines between comments and class definition]
class docker () {

  class { 'linux-kernel' : }

  exec {"install-docker":
    command => "/usr/bin/curl -sSL https://get.docker.com/ubuntu/ | sh",
    require => Exec['install_linux_kernel'],
  }->
  service { "docker":
    ensure  => "running",
    enable  => "true",
  }

  file { 'default_docker':
    notify  => Service["docker"],
    path    => "/etc/default/docker",
    source  => "puppet:///modules/${module_name}/default_docker",
    mode    => '0644',
    require => Exec["install-docker"],
  }
    
  file { 'setdockerenv':
    path    => "/etc/profile.d/setdockerenv.sh",
    source  => "puppet:///modules/${module_name}/etc/setdockerenv.sh",
    owner   => "root",
    group   => "root",
    mode    => '0755',
  }

  host { 'dev.localhost':
    name => 'dev.localhost',
    ip => '127.0.0.1',
  }

  host { 'localhost.dev':
    name => 'localhost.dev',
    ip => '127.0.0.1',
  }

}
