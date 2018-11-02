require 'diary'

describe Diary do

  it { is_expected.to respond_to :lock}

  it { is_expected.to respond_to :unlock}

  it { is_expected.to respond_to :add_entry}

  it { is_expected.to respond_to :get_entry}

  it 'is locked by default' do
      expect { subject.add_entry('entry') }.to raise_error "#{described_class.name} is locked"
    end
end
