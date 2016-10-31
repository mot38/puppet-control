# Class profiles::docker
# This class will manage docker installations from their repo
#
# Parameters:
#  NIL
#
# Sample Usage:
#   class { 'profiles::docker': }
#
#

class profiles::docker (


){

yumrepo { 'DockerRepository':
  ensure   => 'present',
  baseurl  => 'https://yum.dockerproject.org/repo/main/centos/$releasever/',
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => 'https://yum.dockerproject.org/gpg'
}

package {'python-pip' :
  ensure => present,
}
# added ensure = running and enable = true

package { 'docker-engine' :
  ensure  => present,
  ensure  => running,
  enable  => true,
  require => Yumrepo['DockerRepository']
  }

package {'backports.ssl-match-hostname' :
  ensure   => '3.5.0.1',
  provider => pip,
  require  => Package['python-pip']
}

package {'docker-compose' :
  ensure   => present,
  provider => pip,
  require  => Package['backports.ssl-match-hostname']
}

}
