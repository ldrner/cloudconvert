require 'spec_helper'

RSpec.describe Cloudconvert::Api::Client do # , :aggregate_failures
  let(:connection) { instance_double('Cloudconvert::Connection') }
  let(:parser) { double('Cloudconvert::ResponseParser') }
  let(:client) { Cloudconvert::Api::Client.new(connection, parser) }
  let(:succes_upload_body) { build(:succes_upload_body) }
  let(:parsed_response) { Cloudconvert::Api::Response.new(url: succes_upload_body.url, step: succes_upload_body.step, output: succes_upload_body.output) }
  let(:connection_unsuccess_response) do
    OpenStruct.new(
      code: 404,
      body: json(:error_status_body)
    )
  end

  let(:connection_success_response) do
    OpenStruct.new({
      body: json(:succes_upload_body),
      code: 200
    })
  end

  context 'responds to API interface methods' do
    subject { Cloudconvert::Api::Client.new('foo','bar') }
    it { is_expected.to respond_to(:convert) }
    it { is_expected.to respond_to(:status) }
  end

  describe '#convert' do
    context 'when connection returns response' do
      before do
        allow(Cloudconvert::Utilities).to receive(:is_url?).with(any_args).and_return(true)
        allow(connection).to receive(:post).with(any_args).and_return(connection_success_response)
        allow(parser).to receive(:parse).with(connection_success_response).and_return(parsed_response)
      end

      it 'responds to process_url and step' do
        api_response = client.convert('some_location' , 'some_format')
        expect(api_response.process_url).to eq("https:#{succes_upload_body.url}")
        expect(api_response.step).to eq(succes_upload_body.step)
      end
    end

    context 'when connection fails' do
      before do
        allow(Cloudconvert::Utilities).to receive(:is_url?).with(any_args).and_return(true)
        allow(connection).to receive(:post).with(any_args).and_raise(StandardError)
      end

      it 'raise error' do
        expect{ client.convert('some_location', 'some_format') }.to raise_error(StandardError)
      end
    end

    context 'when connection responds with error code' do
      it 'raise `Cloudconvert::APIError`'
    end
  end

  describe '#status' do
    context 'when connection returns success' do
      before do
        allow(connection).to receive(:get).with(any_args).and_return(connection_success_response)
        allow(parser).to receive(:parse).with(connection_success_response).and_return(parsed_response)
      end

      it 'responds to step and output_url' do
        api_response = client.status('https://some_process_url')
        expect(api_response.step).to eq(succes_upload_body.step)
        expect(api_response.output_url).to eq("https:#{succes_upload_body.output[:url]}")
      end
    end

    context 'when connection returns error' do
      it 'raise `Cloudconvert::APIError`'
    end

    context 'when connection fails' do
      before do
        allow(Cloudconvert::Utilities).to receive(:is_url?).with(any_args).and_return(true)
        allow(connection).to receive(:get).with(any_args).and_raise(StandardError)
      end

      it 'raise error' do
        expect{ client.status('https://some_process_url') }.to raise_error(StandardError)
      end
    end
  end
end