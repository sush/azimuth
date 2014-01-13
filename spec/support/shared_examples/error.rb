shared_examples 'an error' do |status_code, exception|
  it "raising #{exception.name} when http status code is #{status_code}" do
    VCR.turn_off!

    endpoint = 'bigboombadaboum'

    stub_post(endpoint).to_return(
      body: { info: { statuscode: status_code, messages: ['error'] } }.to_json,
    )

    expect { client.post(endpoint) }.to raise_error(exception, 'error')

    VCR.turn_on!
  end
end
