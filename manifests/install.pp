# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include metricbeat::install
class metricbeat::install (
  String $metricbeat_package,
  String $metricbeat_ensure,
  String $metricbeat_repo,
){

  yumrepo { 'elastic-7.x':
    ensure   => 'present',
    descr    => 'Elastic repository for 7.x packages',
    baseurl  => $metricbeat_repo,
    enabled  => true,
    gpgcheck => false,
  }

  package { $metricbeat_package :
    ensure => $metricbeat_ensure,
  }
}
