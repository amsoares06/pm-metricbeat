# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include metricbeat::config
class metricbeat::config (
  String $logging_level,
  String $logging_selectors,

){

  file { '/etc/metricbeat/metricbeat.yml':
    ensure  => file,
    content => epp('metricbeat/metricbeat.yml.epp',
      {
        'logging_level'     => $logging_level,
        'logging_selectors' => $logging_selectors,
      }
    ),
  }
}
