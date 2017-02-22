require 'spec_helper'
describe 'kapacitor' do

  context 'with defaults for all parameters' do
    it { should contain_class('kapacitor') }
  end
end
