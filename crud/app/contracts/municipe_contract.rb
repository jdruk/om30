# frozen_string_literal: true

class MunicipeContract < ApplicationContract
  params do
    required(:name).filled(:string)
    required(:phone).filled(:string)
    required(:email).filled(:string)
    required(:status).filled(:string)
    required(:cpf).filled(:string)
    required(:cns).filled(:string)
    required(:birthdate).filled(:date)
    required(:photo).value(:filled?)
  end

  rule(:cpf) do
    key.failure('CPF inválido') unless CPF.valid?(value)
  end

  rule(:birthdate) do
    key.failure('not must be in the future') if value > Time.zone.today # caso impossível
  end

  rule(:cns).validate(:cns_format)
  rule(:email).validate(:email_format)
end
