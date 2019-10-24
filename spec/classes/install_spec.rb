require 'spec_helper'

describe 'metricbeat::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os} with default hieradata" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('metricbeat::install') }
      it {
        is_expected.to contain_yumrepo('elastic-7.x')
          .with(
            'ensure'   => 'present',
            'descr'    => 'Elastic repository for 7.x packages',
            'baseurl'  => 'https://artifacts.elastic.co/packages/7.x/yum',
            'enabled'  => 'true',
            'gpgcheck' => 'false',
          )
      }
      it {
        is_expected.to contain_package('metricbeat')
          .with(
            'ensure' => 'present',
          )
      }
    end

    context "on #{os} with custom hieradata" do
      let(:facts) do
        os_facts.merge('hiera_file' => 'custom')
      end

      it { is_expected.to compile }
      it { is_expected.to contain_class('metricbeat::install') }
      it {
        is_expected.to contain_yumrepo('elastic-7.x')
          .with(
            'ensure'   => 'present',
            'descr'    => 'Elastic repository for 7.x packages',
            'baseurl'  => 'https://some.thing.nl/packages/7.x/yum',
            'enabled'  => 'true',
            'gpgcheck' => 'false',
          )
      }
      it {
        is_expected.to contain_package('metricbeat')
          .with(
            'ensure' => 'latest',
          )
      }
    end
  end
end
