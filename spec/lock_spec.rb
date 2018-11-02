require 'lock'

describe Lock do

    it { is_expected.to respond_to :lock}

    it { is_expected.to respond_to :unlock}

    describe '#lock' do
      it 'can lock' do
        subject.unlock
        subject.lock
        expect(subject.locked).to eq true
      end
    end

    describe '#unlock' do
      it 'can unlock' do
        subject.unlock
        expect(subject.locked).to eq false
      end
    end

end
