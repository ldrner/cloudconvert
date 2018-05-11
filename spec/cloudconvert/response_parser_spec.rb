require 'spec_helper'

RSpec.describe Cloudconvert::ResponseParser do
  subject { Cloudconvert::ResponseParser }
  let(:success_http_response) { HTTP::Response.new(status: 200, version: 1.1, body: JSON.generate({})) }
  let(:unsuccess_http_response) { HTTP::Response.new(status: 404, version: 1.1, body: JSON.generate({})) }

  describe '#parse' do
    it 'returns response' do
      response = subject.parse(success_http_response)
      expect(response).to be_an_instance_of(Cloudconvert::Api::Response)
    end

    it 'fails when the response code is different from 200' do
      expect { subject.parse(unsuccess_http_response) }.to raise_error(Cloudconvert::APIError)
    end

    it 'not fails when the response code is 200 (OK)' do
      expect { subject.parse(success_http_response) }.not_to raise_error
    end
  end
end