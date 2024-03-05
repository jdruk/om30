# frozen_string_literal: true

module Operation
  module Municipe
    class Create < Trailblazer::Operation
      step :validate
      step :create_model
      left :handle_errors
      step :notify

      def validate(ctx, params:, **)
        contract = ::MunicipeContract.new
        attributes = params[:model_attributes].to_h
        result = contract.call(attributes)

        if result.failure?
          ctx[:errors] = result.errors
          return
        end

        ctx[:model_attributes] = attributes
      end

      def create_model(ctx, model_attributes:, **)
        municipe = ::Municipe.new(model_attributes)
        municipe.save
        ctx[:model] = municipe
      end

      def handle_errors(ctx, errors:, **)
        ctx[:status_code] = 422
        ctx[:errors] = errors
      end

      def notify(ctx, model:, **)
        WelcomeJob.perform_later(id: model.id)
        ctx[:status_code] = 204
      end
    end
  end
end
