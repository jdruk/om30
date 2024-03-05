# frozen_string_literal: true

class UpdateMunicipeJob < ApplicationJob
  queue_as :critical

  def perform(*args)
    # Do something later
  end
end
