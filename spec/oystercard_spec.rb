require 'oystercard'

describe Oystercard do
  describe '#top_up' do
    it 'should allow user to increase balance by a specified amount' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'should raise an error when top up results in balance > £90' do
      expect{ subject.top_up(91) }.to raise_error 'Balance cannot exceed £90'
    end
  end

  describe '#deduct' do
    it 'should reduce balance by specified amount' do
      subject.top_up(10)
      subject.deduct(5)
      expect(subject.balance).to eq 5
    end
  end

  describe '#in_journey?' do
    it 'should not be in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'should adjust status to in_journey' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_out' do
    it 'should adjust status to not_in_journey' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
