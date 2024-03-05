# frozen_string_literal: true

json.extract! municipe, :id, :name, :phone, :email, :cpf, :cns, :birthdate, :photo, :status, :created_at, :updated_at
json.url municipe_url(municipe, format: :json)
