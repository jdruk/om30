# frozen_string_literal: true

class WelcomeJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Rails.logger.debug 'manda email de boas vindas ou etc'
  end
end
