# frozen_string_literal: true

require 'ibge'

module MunicipesHelper
  def self.ufs
    ::IBGE::UF.obter_ufs
  end
end
