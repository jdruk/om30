# frozen_string_literal: true

class Municipe < ApplicationRecord
  # O correto para rastreabilidade deveria ser a implementação da gem audited ou papertrail
  # guardado o estado de onde foi oriunda a alteração e etc.

  # relactions
  has_one :address, dependent: :destroy

  # validations
  validates_with_dry

  # mount for files
  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :address, allow_destroy: true
end
