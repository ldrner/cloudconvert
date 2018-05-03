require 'spec_helper'

RSpec.describe Cloudconvert::Utilities do
  let(:utils) { Cloudconvert::Utilities }
  describe 'deep_symbolize_keys' do
    before do
      @regular_hash = {
        'a' => 1,
        'b' => {'c' => 3, 'd' => 4},
        'e' => [{'f' => 6, 'g' => 7},{'h' => 8, 'i' => [{'j' => 9},{'k' => 10}]}]
      }
      @symbolized_hash = {
        a: 1,
        b: {c: 3, d: 4},
        e: [{f: 6, g: 7}, {h: 8, i: [{j: 9}, {k: 10}]}]
      }
    end

    it 'should deep_symbolize_keys' do
      expect(utils.deep_symbolize_keys(@regular_hash)).to eq(@symbolized_hash)
    end
  end
end