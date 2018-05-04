require 'spec_helper'

RSpec.describe Cloudconvert::Api::Response do
  let(:success_body) { json(:success_body) }
  let(:response_hash) { Cloudconvert::Utilities.deep_symbolize_keys(JSON.parse(success_body)) }
  subject(:api_responce) { Cloudconvert::Api::Response.new(response_hash) }

  it 'should responds to instance methods' do
    expect(api_responce).to respond_to(:finished?)
    expect(api_responce).to respond_to(:step)
    expect(api_responce).to respond_to(:process_url)
    expect(api_responce).to respond_to(:output_url)
  end

  it "instance is available as `Cloudconvert::Api::Response`" do
    expect(api_responce).to be_an_instance_of(Cloudconvert::Api::Response)
  end

  describe '#finished?' do
    let(:not_finished_response) { Cloudconvert::Api::Response.new(step: "input") }
    let(:finished_response) { Cloudconvert::Api::Response.new(step: "finished") }
    it 'is true if  step == finished' do
      expect(finished_response.finished?).to be true
    end
    it 'is false if  step != finished' do
      expect(not_finished_response.finished?).to be false
    end
  end
end