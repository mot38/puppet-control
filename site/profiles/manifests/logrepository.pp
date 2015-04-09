# Class profiles::logrepository
#
# Sample Usage:
#   class { 'profiles::logrepository': }
#
class profiles::logrepository {

  class { 'redis': }

  class { 'elasticsearch': }

  class { 'logstash':
    java_install => true,
    package_url  => 'https://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.4.1-1_bd507eb.noarch.rpm',
    }

  class { 'kibana': }

}