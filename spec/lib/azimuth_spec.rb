require 'spec_helper'

describe Azimuth do
  describe '.respond_to?' do
    context 'with an existing Azimuth method' do
      it 'responds to method' do
        expect(Azimuth.respond_to?(:new, true)).to be_true
      end
    end

    context 'with an existing Azimuth::Client method' do
      it 'responds to method' do
        expect(Azimuth.respond_to?(:post, true)).to be_true
      end

      it 'delegates to Azimuth::Client' do
        Azimuth::Client.stub_chain(:new, :post).and_return(true)

        expect(Azimuth::Client).to receive(:new).ordered
        expect(Azimuth::Client).to receive(:new).ordered

        Azimuth.post('fuubar', test: {} )
      end
    end
  end

  describe '.new' do
    it 'returns a Azimuth::Client' do
      expect(Azimuth.new).to be_a Azimuth::Client
    end
  end
end
