# frozen_string_literal: true

class AddressContract < ApplicationContract
  params do
    required(:zip_code).filled(:string)
    required(:public_place).filled(:string)
    required(:city).filled(:string)
    required(:uf).filled(:string)

    # optinals fields
    optional(:ibge).value(:str?)
    optional(:complement).value(:str?)
  end
end
