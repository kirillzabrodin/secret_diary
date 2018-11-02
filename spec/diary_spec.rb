require 'diary'

describe Diary do

  it { is_expected.to respond_to :lock}

  it { is_expected.to respond_to :unlock}

  it { is_expected.to respond_to :add_entry}

  it { is_expected.to respond_to :get_entry}

  describe '#add_entry' do

    it 'is locked by default' do
      expect { subject.add_entry }.to raise_error "#{described_class.name} is locked"
    end

    it 'can write to @entry when unlocked' do
      subject.unlock
      expect(subject.add_entry('Adding entry')).to eq 'Adding entry'
    end

    it 'can be re-locked' do
      subject.unlock
      subject.lock
      expect { subject.add_entry }.to raise_error "#{described_class.name} is locked"
    end

  end

  describe '#get_entry' do

    it 'is locked by default' do
      expect { subject.get_entry }.to raise_error "#{described_class.name} is locked"
    end

    it 'can read to @entry when unlocked' do
      subject.unlock
      expect(subject.get_entry).to eq ""
    end

    it 'can be re-locked' do
      subject.unlock
      subject.lock
      expect { subject.get_entry }.to raise_error "#{described_class.name} is locked"
    end
  end

end
