require 'spec_helper'

describe Hash do
  describe '#camelize_keys!' do
    context 'with underscores keys' do
      let(:hash) { { first_key: 1 } }

      before { hash.camelize_keys! }

      it 'camelized hash keys' do
        expect(hash.keys.first).to eql(:firstKey)
      end
    end

    context 'with camelized keys' do
      let(:hash) { { firstKey: 1 } }

      before { hash.camelize_keys! }

      it 'keeps keys camelized' do
        expect(hash.keys.first).to eql(:firstKey)
      end
    end
  end
end
