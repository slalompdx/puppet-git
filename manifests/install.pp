# == Class git::install
#
# This class is called from git for install.
#
class git::install {

  package { $::git::package_name:
    ensure => present,
  }
}
