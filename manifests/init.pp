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
  $install_chocolatey = ::git::params::install_chocolatey,
) inherits ::git::params {

  # validate parameters here
  validate_bool($install_chocolatey)

  if $install_chocolatey {
    include chocolatey
  }

  package { 'git':
    ensure   => installed,
    provider => 'chocolatey',
  }
}
