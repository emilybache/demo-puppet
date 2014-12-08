# Class:linux-kernel
#
# You have to re-start your machine after you upgrade the kernel. This puppet script doesn't do that.
#
# [Remember: No empty lines between comments and class definition]
class linux-kernel () {

  $tempdir = "/tmp"
  $kernel_version = "3.16.3"

  file { "update_kernel_sources":
    source  => "puppet:///modules/${module_name}/kernel",
    purge   => true,
    force   => true,
    recurse => true,
    backup  => false,
    path => "${tempdir}/kernel",
  }

  file { "check_kernel":
    source  => "puppet:///modules/${module_name}/check_kernel_version.py",
    path => "${tempdir}/check_kernel_version.py",
  }

  exec { 'install_linux_kernel':
    command => "/usr/bin/dpkg -i linux-headers-${kernel_version}-*.deb linux-image-${kernel_version}-*.deb",
    user => root,
    cwd => "${tempdir}/kernel",
    unless => "/usr/bin/python ${tempdir}/check_kernel_version.py  '${kernel_version}'",
    require => [File["update_kernel_sources"],
                File ["check_kernel"]],
  }

}
