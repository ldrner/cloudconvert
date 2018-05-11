require 'spec_helper'

RSpec.describe Cloudconvert::Utilities do
  let(:utils) { Cloudconvert::Utilities }
  describe '#deep_symbolize_keys' do
    let(:regular_hash) do
      {
        'a' => 1,
        'b' => {'c' => 3, 'd' => 4},
        'e' => [{'f' => 6, 'g' => 7},{'h' => 8, 'i' => [{'j' => 9},{'k' => 10}]}]
      }
    end
    let(:symbolized_hash) do
      {
        a: 1,
        b: {c: 3, d: 4},
        e: [{f: 6, g: 7}, {h: 8, i: [{j: 9}, {k: 10}]}]
      }
    end


    it 'should deep symbolize keys' do
      expect(utils.deep_symbolize_keys(regular_hash)).to eq(symbolized_hash)
    end
  end

  describe '#validate_keys' do
    it 'should raise' do
      expect do
        utils.validate_keys({ :foo => 'foo', :bar => 'jpg' }, [:input, :inputformat])
        utils.validate_keys({ :foo => 'foo', :bar => 'jpg' }, :input, :inputformat)
      end.to raise_error(ArgumentError, 'Required key(s): input, inputformat')
    end

    it 'does not raise' do
      expect do
        utils.validate_keys({ :input => 'foo', :inputformat => 'jpg' }, [:input, :inputformat])
        utils.validate_keys({ :input => 'foo', :inputformat => 'jpg' }, :input, :inputformat)
      end.not_to raise_error
    end
  end

  describe '#revise_url' do
    before do
      @url = '//host123d1w3.cloudconvert.com/download/~yvcx6DqdfCQOIZFemYJG6w5QngQ'
      @revised_url = 'https://host123d1w3.cloudconvert.com/download/~yvcx6DqdfCQOIZFemYJG6w5QngQ'
    end
    it 'should add scheme to url' do
      expect(utils.revise_url(@url)).to eq(@revised_url)
    end
    it 'should return nil if url blank' do
      expect(utils.revise_url('')).to be_nil
    end
  end

  describe '#is_url?' do
    let(:url) { 'https://host123d1w3.cloudconvert.com/download/~yvcx6DqdfCQOIZFemYJG6w5QngQ' }
    let(:not_url) { 'file://some_local_file_path.rb' }

    it 'should return true if correct url received' do
      expect(utils.is_url?(url)).to be true
    end
    it 'should return false if no url received' do
      expect(utils.is_url?(nil)).to be false
    end
    it 'should return false if received some unlike url' do
      expect(utils.is_url?(not_url)).to be false
    end
  end
end