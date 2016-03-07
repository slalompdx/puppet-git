# Class: git
# ===========================
#
# Full description of class git here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class git (
  $package_name = $::git::params::package_name,
  $service_name = $::git::params::service_name,
) inherits ::git::params {

  # validate parameters here

  class { '::git::install': } ->
  class { '::git::config': } ~>
  class { '::git::service': } ->
  Class['::git']
}
