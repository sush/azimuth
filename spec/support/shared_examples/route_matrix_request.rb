shared_examples 'a route matrix request' do
  let(:locations) do
    ['48.843079, 2.314442', '48.869061, 2.383329', '49.000000, 2.300000']
  end

  let(:route_matrix_result) { client.route_matrix(locations) }

  it 'returns locations distances to destination' do
    route_matrix_result.each do |location|
      expect(location.distance).not_to be_nil
    end
  end

  it 'returns locations driving times to destination' do
    route_matrix_result.each do |location|
      expect(location.time).not_to be_nil
    end
  end

  it 'returns locations coordinates' do
    route_matrix_result.each do |location|
      expect(location.latitude).not_to be_nil
      expect(location.longitude).not_to be_nil
    end
  end
end
