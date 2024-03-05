# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Dependendo do ambiente seleciona como deve ser guardado
  storage(Rails.env.production? ? :fog : :file)

  # para proteger de possivels crawling
  def store_dir
    "uploads/#{SecureRandom.hex}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fill: [200, 200]
  end

  # boa prática
  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
