# frozen_string_literal: true

class Address < ApplicationRecord
  # relactions
  belongs_to :municipe

  # validations
  validates_with_dry
end
