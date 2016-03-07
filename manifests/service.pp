# == Class git::service
#
# This class is meant to be called from git.
# It ensure the service is running.
#
class git::service {

  service { $::git::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
