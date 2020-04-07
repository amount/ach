# frozen_string_literal: true

require 'spec_helper'

describe ACH::Records::FileHeader do
  before(:each) do
    @header = ACH::Records::FileHeader.new
    @header.immediate_destination_name = 'destination'
    @header.immediate_destination = '123456789'
    @header.immediate_origin_name = 'origin'
    @header.immediate_origin = '123456789'
  end

  describe '#to_ach' do
    it { expect(@header.to_ach.length).to eq(94) }
  end

  describe '#immediate_origin_to_ach' do
    it 'adds a leading space when only 9 digits' do
      expect(@header.immediate_origin_to_ach).to eq(' 123456789')
    end

    it 'does not add a leading space when 10 digits' do
      @header.immediate_origin = '1234567890'
      expect(@header.immediate_origin_to_ach).to eq('1234567890')
    end
  end

  describe '#immediate_origin_to_ach' do
    it 'adds a leading space when only 9 digits' do
      expect(@header.immediate_destination_to_ach).to eq(' 123456789')
    end

    it 'does not add a leading space when 10 digits' do
      @header.immediate_destination = '1234567890'
      expect(@header.immediate_destination_to_ach).to eq('1234567890')
    end
  end
end
