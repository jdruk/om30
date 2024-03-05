# frozen_string_literal: true

require 'test_helper'

class MunicipeTest < ActiveSupport::TestCase
  setup do
    @municipe = municipes(:municipe_one)
  end

  test 'municipe should have one address' do
    assert_respond_to @municipe, :address, 'Municipe should respond to address method'
  end
end
