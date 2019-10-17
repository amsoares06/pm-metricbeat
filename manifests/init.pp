# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include metricbeat
class metricbeat {

  contain metricbeat::install
  contain metricbeat::config
  contain metricbeat::service

  Class['metricbeat::install']
  -> Class['metricbeat::config']
  ~> Class['metricbeat::service']
}
