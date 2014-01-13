require 'spec_helper'

describe Azimuth::Client::RouteMatrix do
  describe '.route_matrix', :vcr do
    it_behaves_like 'a route matrix request'

    let(:locations) do
      ['48.843079, 2.314442', '48.869061, 2.383329', '49.000000, 2.300000']
    end

    context 'with no optionnal options' do
      let(:route_matrix_result) { client.route_matrix(locations) }

      it 'does not return destination informations' do
        expect(route_matrix_result.size).to eql 2
      end
    end

    context 'with many to one options' do
      let(:route_matrix_result) do
        client.route_matrix(locations, manyToOne: true)
      end

      it 'does not return destination informations' do
        expect(route_matrix_result.size).to eql 2
      end
    end

    context 'with all to all options' do
      let(:route_matrix_result) do
        client.route_matrix(locations, allToAll: true)
      end

      it 'it returns destination informations' do
        expect(route_matrix_result.size).to eql 3
      end
    end
  end
end
