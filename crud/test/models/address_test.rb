require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @address = addresses(:address_one)
  end

  test 'address should belong to municipe' do
    assert_respond_to @address, :municipe, 'Address should respond to municipe method'
  end
end
