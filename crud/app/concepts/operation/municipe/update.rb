# frozen_string_literal: true

module Operation
  module Municipe
    class Update < Create
      step :find_model, replace: :create_model

      def find_model(ctx, params:, model_attributes:, **)
        municipe = params[:model]
        municipe.update(model_attributes)

        ctx[:model] = municipe
      end

      def notify(ctx, model:, **)
        UpdateMunicipeJob.perform_later(id: model.id)
        ctx[:status_code] = 201
      end
    end
  end
end
