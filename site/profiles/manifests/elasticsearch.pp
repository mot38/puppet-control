# Class profiles::elasticsearch
#
# Will install elasticsearch on a node.
#
# Sample Usage:
#   class { 'profiles::elasticsearch': }
#
class profiles::elasticsearch {

package { 'elasticsearch' :
  ensure => 'present',
  status => 'enabled',
  }
}