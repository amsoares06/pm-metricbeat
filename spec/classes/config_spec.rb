require 'spec_helper'

describe 'metricbeat::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('metricbeat::config') }
      it { is_expected.to contain_file('/etc/metricbeat/metricbeat.yml')
        .with_content(/This file is managed by Puppet/)
        .with_content(/logging.level: debug/)
        .with_content(/logging.selectors: \["service"\]/)
      }
    end
  
  context "on #{os} with custom hieradata" do
    let(:facts) do
      os_facts.merge('hiera_file' => 'custom')
    end

    it { is_expected.to compile }
    it { is_expected.to contain_class('metricbeat::config') }
    it { is_expected.to contain_file('/etc/metricbeat/metricbeat.yml')
      .with_content(/This file is managed by Puppet/)
      .with_content(/logging.level: warning/)
      .with_content(/logging.selectors: \["\*"\]/)
    }
    end
  end
end
