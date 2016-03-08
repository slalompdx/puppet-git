# == Class git::params
#
# This class is meant to be called from git.
# It sets variables according to platform.
#
class git::params {
  case $::osfamily {
    'Windows': {
      $package_name = 'git'
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $install_chocolatey = false
}
