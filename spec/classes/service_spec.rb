require 'spec_helper'

describe 'metricbeat::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('metricbeat::service') }
      it { is_expected.to contain_service('metricbeat')
        .with(
          'ensure' => 'running',
          'enable' => 'true',
        )
      }
    end

    context "on #{os} with custom hieradata" do
      let(:facts) do
        os_facts.merge('hiera_file' => 'custom')
      end
  
      it { is_expected.to compile }
      it { is_expected.to contain_class('metricbeat::service') }
      it { is_expected.to contain_service('metricbeat')
        .with(
          'ensure' => 'running',
          'enable' => 'false',
        )
      }
    end
  end
end
