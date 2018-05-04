RSpec.describe Cloudconvert do
  # let(:connection) { Cloudconvert::Connection.new(CONFIGURATION) }
  # let(:parser) { Cloudconvert::ResponseParser }
  # let(:cloudconvert_client) { Cloudconvert::Api::Client.new(connection, parser) }
  let(:client) { Cloudconvert.client(CONFIGURATION) }

  it "has a version number" do
    expect(Cloudconvert::VERSION).not_to be nil
  end

  describe '#client' do
    it 'should respond to client api' do
      expect(client).to respond_to(:convert)
      expect(client).to respond_to(:status)
    end
  end
end
