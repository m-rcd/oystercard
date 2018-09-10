require 'oystercard'

describe Oystercard do
  it { is_expected.to have_attributes(:default_balance => 0) }
end
