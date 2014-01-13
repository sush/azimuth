require 'spec_helper'

describe Azimuth::Request do
  it_behaves_like 'an error', 400, Azimuth::ErrorWithInput
  it_behaves_like 'an error', 403, Azimuth::KeyRelatedError
  it_behaves_like 'an error', 500, Azimuth::UnknownError

  Array(600...699).each do |status_code|
    it_behaves_like 'an error', status_code, Azimuth::OtherError
  end
end
