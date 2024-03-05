# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  register_macro(:email_format) do
    key.failure('not a valid email format') unless /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.match?(value)
  end

  register_macro(:cns_format) do
    value.gsub(/\D/, '')

    # faz validação ...
  end
end
