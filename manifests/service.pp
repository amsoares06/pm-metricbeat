# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include metricbeat::service
class metricbeat::service (
  String  $service_ensure,
  Boolean $service_enable,
){

  service { 'metricbeat':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
