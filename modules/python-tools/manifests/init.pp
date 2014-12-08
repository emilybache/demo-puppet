# Class: texttest
#
# This class actually installs lots of 3rd party python packages including texttest
#
# [Remember: No empty lines between comments and class definition]
class python-tools() {

  $python_deps = [
        'python2.7',
        'python-pip',
        'python-setuptools',
        'python-dev',
        'poppler-utils', # for pdf2text utility
      ]

  package { $python_deps:
      ensure => 'installed',
  }
  package { "capturemock":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }
  package { "pyyaml":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }
  package { "fabric":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }
  package { "psutil":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }
  package { "docker-py":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }
  package { "texttest":
    ensure    => "installed",
    provider  => pip,
    require   => Package[$python_deps],
  }

  file { 'texttestpath':
    path    => "/etc/profile.d/texttest_path.sh",
    source  => "puppet:///modules/${module_name}/etc/texttest_path.sh",
    owner   => "root",
    group   => "root",
    mode    => '0755',
  }
}
