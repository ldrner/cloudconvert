require 'spec_helper'

RSpec.describe Cloudconvert::Connection do
  subject(:connection) { Cloudconvert::Connection.new(:apikey => API_KEY) }
  let(:success_body) { json(:success_body) }

  it 'should raise error when initialized without `:apikey`' do
    expect { Cloudconvert::Connection.new(:apikei => API_KEY) }.to raise_error(Cloudconvert::AuthenticationError, "No API key provided.")
  end
  it 'does not raise error when initialized with good `:apikey`' do
    expect { Cloudconvert::Connection.new(:apikey => API_KEY) }.not_to raise_error
  end

  describe '#get' do
    before do
      stub_request(:get, /process/).to_return(body: success_body, status: 200)
    end

    it 'responded' do
      expect(connection).to respond_to(:get)
    end

    it "returns an instance of `HTTP::Response`" do
      expect(connection.get(STATUS_PATH)).to be_an_instance_of(HTTP::Response)
    end

    it { expect(connection.get(STATUS_PATH).body.to_s).to eq success_body }
  end

  describe '#post' do
    let(:correct_params) {
      {
        "apikey"=>API_KEY,
        "inputformat"=>"jpg",
        "outputformat"=>"pdf",
        "input"=>"download",
        "file"=>"http://via.placeholder.com/350x150",
        "wait"=>"false",
        "download"=>"false"
      }
    }
    before do
      stub_request(:post, /convert/).
        with(
          body: {"apikey"=>"api_key"}
        ).
        to_return(status: 200, body: success_body, headers: {})
      stub_request(:post, 'https://api.cloudconvert.com/convert').
        with(
          body: correct_params,
          headers: {
            'Content-Type'=>%r[application/x-www-form-urlencoded],
          }).
        to_return(status: 200, body: success_body, headers: {})
    end

    it 'responded' do
      expect(connection).to respond_to(:post)
    end

    it "returns an instance of `HTTP::Response`" do
      response = connection.post(Cloudconvert::Api::Client::CONVERT_PATH)
      expect(response).to be_an_instance_of(HTTP::Response)
    end

    it "works with client" do
      response = connection.post(Cloudconvert::Api::Client::CONVERT_PATH, correct_params)
      expect(response.body.to_s).to eq(success_body)
    end
  end

end