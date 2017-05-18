require 'spec_helper'
describe 'nifi' do
  context 'with default values for all parameters' do
    it { should contain_class('nifi') }
  end
end
