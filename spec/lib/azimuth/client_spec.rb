require 'spec_helper'

describe Azimuth::Client do
  describe 'module configuration' do
    before do
      Azimuth.reset!

      Azimuth.configure do |config|
        Azimuth::Configuration::VALID_OPTIONS.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after { Azimuth.reset! }

    it "inherits the module configuration" do
      client = Azimuth::Client.new

      Azimuth::Configuration::VALID_OPTIONS.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq "Some #{key}"
      end
    end
  end

  context 'with class level configuration' do
    describe 'api_endpoint' do
      it 'sets api_endpoint' do
        client = Azimuth::Client.new

        expect(client.api_endpoint).
          to eql 'http://www.mapquestapi.com/directions/v2/'
      end

      it 'overrides module configuration' do
        client = Azimuth::Client.new(api_endpoint: 'http://fuubar.com')

        expect(client.api_endpoint).to eql 'http://fuubar.com'
      end
    end

    describe 'api_key' do
      it 'sets api_key'  do
        client = Azimuth::Client.new

        expect(client.api_key).to be_nil
      end

      it 'overrides module configuration' do
        client = Azimuth::Client.new(api_key: 'randomkey')

        expect(client.api_key).to eql 'randomkey'
      end
    end
  end
end
