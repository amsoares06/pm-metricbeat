require 'spec_helper'

describe 'metricbeat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it {
        is_expected.to contain_class('metricbeat::install')
          .that_comes_before('Class[metricbeat::config]')
      }
      
      it {
        is_expected.to contain_class('metricbeat::config')
          .that_comes_before('Class[metricbeat::service]')
      }

      it { is_expected.to contain_class('metricbeat::service') }
    end
  end
end
